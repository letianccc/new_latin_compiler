

import os
from front_.mycompiler import compile
from front_.util import *
import subprocess


def filepaths(test_dir):
    ps = []
    old = os.getcwd()
    os.chdir(test_dir)
    paths = [ os.path.abspath(name) for name in os.listdir(test_dir)]
    kinds = filter(os.path.isdir, paths)
    for kind_dir in kinds:
        # kind_dir = os.path.join(test_dir, k)
        files = os.listdir(kind_dir)
        x = lambda path: path.endswith('.c')
        cfiles = filter(x, files)
        for cfile in cfiles:
            sfile = cfile[:-1] + 's'
            cfile = os.path.join(kind_dir, cfile)
            sfile = os.path.join(kind_dir, sfile)
            pair = (cfile, sfile)
            ps.append(pair)
    os.chdir(old)
    return ps


def test_sfile(tmp_path, refer_path):
    if os.stat(refer_path).st_size == 0:
        return
    with open(refer_path, 'r') as refer:
        with open(tmp_path, 'r') as tmp:
            assert_lines(tmp.read(), refer.read())

def assert_lines(mybuffer, refer_buffer):
    refer_lines = refer_buffer.split('\n')
    lines = mybuffer.split('\n')
    for index, refer_line in enumerate(refer_lines):
        line = lines[index]
        if refer_line != line:
            # path = os.path.relpath(path, test_dir)
            # log(path)
            log(f'{index}: expect({refer_line})')
            log(f'{index}: code  ({line})')
            raise Exception

def assert_file(test_dir, cpath, refer_spath, check_exefile, check_sfile, check_irfile):
    # log(cpath)
    out_refer = cpath[:-1] + 'out'
    ir_refer = cpath[:-1] + 'ir'
    prefix = fr'{test_dir}\tmp'
    tmp_spath = None
    tmp_irpath = None
    exe_path = prefix
    tmp_spath = prefix + '.s'
    if os.path.isfile(ir_refer):
        tmp_irpath = prefix + '.ir'

    code = compile(cpath, tmp_spath, tmp_irpath)
    if code == '':
        return

    exist = os.path.isfile(ir_refer)
    if check_irfile and exist:
        test_sfile(tmp_irpath, ir_refer)

    exist = os.path.isfile(out_refer)
    if check_exefile and exist:
        out = execute_sfile(tmp_spath, exe_path)
        out = out.replace('\r', '')
        with open(out_refer, 'r') as refer:
            expect = refer.read()
            assert_lines(out, expect)

    exist = os.path.isfile(refer_spath)
    if check_sfile and exist:
        test_sfile(tmp_spath, refer_spath)

def execute_sfile(spath, exe_path):
    generate_execute_file(spath, exe_path)
    out = execute_exefile(exe_path)
    return out

def execute_exefile(executable_path):
    p = subprocess.run(executable_path, input=b'a', capture_output=True)
    out = p.stdout
    out = out.decode()
    return out

def generate_execute_file(spath, exe_path):
    subprocess.run(['gcc', '-o', exe_path, spath], check=True)
