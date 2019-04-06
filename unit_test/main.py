



import sys
import os
cwd = os.getcwd()
parent = os.path.dirname(os.getcwd())
sys.path.append(parent)

from front_.mycompiler import compile
from front_.util import *
from unit_test.util import *

def _main_():
    test_dir = r'C:\code\new_latin_compiler\unit_test\example'
    paths = filepaths(test_dir)
    for cfile, sfile in paths:
        try:
            assert_file(test_dir, cfile, sfile)
        except Exception:
            path = os.path.relpath(cfile, test_dir)
            log(path)
            raise Exception


_main_()
