
import sys
import os
cwd = os.getcwd()
parent = os.path.dirname(os.getcwd())
sys.path.append(parent)

from front_.mycompiler import compile
from front_.util import *
from unit_test.util import *
import subprocess


def _main_():
    source_dir = r'C:\code\new_latin_compiler\front_\input'
    cpath = fr'{source_dir}\test.c'
    spath = fr'{source_dir}\test.s'
    exe_path = spath[:-2]
    write_code(cpath, spath)
    out = execute_sfile(spath, exe_path)
    print(out)

def write_code(cfile, sfile):
    code = compile(cfile, True)
    with open(sfile, 'w') as f:
        f.write(code)

_main_()
