

import os
from front_.mycompiler import compile
from front_.util import *



def filepaths(test_dir):
    ps = []
    kinds = os.listdir(test_dir)
    for k in kinds:
        kind_dir = os.path.join(test_dir, k)
        files = os.listdir(kind_dir)
        x = lambda path: path.endswith('.c')
        cfiles = filter(x, files)
        for cfile in cfiles:
            sfile = cfile[:-1] + 's'
            cfile = os.path.join(kind_dir, cfile)
            sfile = os.path.join(kind_dir, sfile)
            pair = (cfile, sfile)
            ps.append(pair)
    return ps

def assert_file(test_dir, path, refer_path):
    code = compile(path)
    with open(refer_path, 'r') as refer:
        refer_lines = refer.read().split('\n')
        lines = code.split('\n')
        for index, refer_line in enumerate(refer_lines):
            line = lines[index]
            if refer_line != line:
                path = os.path.relpath(path, test_dir)
                log(path)
                log(f'{index}: expect({refer_line})')
                log(f'{index}: code  ({line})')
                raise Exception
