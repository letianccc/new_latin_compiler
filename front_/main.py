from lexer_ import Lexer
from parser_ import Parser
# import type_system
from type_system import TypeSystem
from mysymbol import SymbolSystem
from util import *
import os
from emit import Emit



def _main_():
    # path = r'C:\code\new_latin_compiler\find_error.c'
    # code = compile(path)

    path = r'C:\code\new_latin_compiler\test.c'
    code = compile(path)
    path = r'C:\code\new_latin_compiler\test.s'

    assert_code(path, code)
    # write_code(path, code)

def compile(input_path):
    f = open(input_path, 'r')
    code = f.read()

    TypeSystem.init()
    SymbolSystem.init()
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    parser = Parser(tokens)
    functions = parser.function_nodes
    for f in functions:
        f.check()
    for f in functions:
        f.gen()
    symbols = [f.symbol for f in functions]
    e = Emit(symbols)
    e.execute()
    code = e.code
    # log(code)
    return code


def write_code(path, code):
    f = open(path, 'w')
    f.write(code)

def assert_code(path, code):
    f = open(path, 'r')
    expect_code = f.read()
    assert expect_code == code



_main_()
