from lexer_ import Lexer
from parser_ import Parser
from generator import Generator_as1
# import type_system
from type_system import TypeSystem
from util import *
import os





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

    TypeSystem.init()

    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    parser = Parser(tokens)
    # ir = Generator(ast)
    # gen = Generator_as(parser)
    gen = Generator_as1(parser)
    gen.gen_executable_ir()
    # gen.gen_test_ir()
    ir = gen.ir
    # ir = insert_(ir)
    # print(ir)
    path = r'C:\code\new_latin_compiler\test.s'
    f = open(path, 'r')
    expect_ir = f.read()
    assert expect_ir == ir

    # print(path)
    # f = open(path, 'w')
    # f.write(ir)




_main_()
