
import sys
import os
cwd = os.getcwd()
parent = os.path.dirname(os.getcwd())
sys.path.append(parent)

from front_.mycompiler import compile
from front_.util import *

def _main_():
    cpath = r'C:\code\new_latin_compiler\test.c'
    spath = r'C:\code\new_latin_compiler\test.s'
    write_code(cpath, spath)


def write_code(cfile, sfile):
    code = compile(cfile)
    with open(sfile, 'w') as f:
        f.write(code)

_main_()
