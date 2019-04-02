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
    # print(code)
    path = r'C:\code\new_latin_compiler\test.s'
    # f = open(path, 'r')
    # expect_ir = f.read()
    # assert expect_ir == ir

    # print(path)
    f = open(path, 'w')
    f.write(code)




_main_()
