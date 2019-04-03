from lexer_ import Lexer
from parser_ import Parser
from generator import *
# import type_system
from type_system import TypeSystem
from util import *
import os
from check import CheckSystem
from emit import Emit



def _main_():

    code = '{int a;a=1;' \
           'printf("value");}'

    code = '{printf("value");}'

    code = '''
        int func() {
            printf("func\n");
        }
        int main() {
            func();
            printf("value\n");
        }

    '''

    path = r'C:\code\new_latin_compiler\test.c'
    f = open(path, 'r')
    code = f.read()
    TypeSystem.init()

    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    parser = Parser(tokens)

    # gen = Generator_as1(parser)
    # gen.gen_executable_ir()
    cs = CheckSystem(parser.AST)
    cs.execute()

    gentor = Gentor(parser.AST)
    gentor.execute()
    symbols = gentor.symbols
    e = Emit(symbols)
    e.execute()
    code = e.code
    # log(code)
    path = r'C:\code\new_latin_compiler\test.s'

    assert_code(path, code)
    # write_code(path, code)

def write_code(path, code):
    f = open(path, 'w')
    f.write(code)

def assert_code(path, code):
    f = open(path, 'r')
    expect_code = f.read()
    assert expect_code == code



_main_()
