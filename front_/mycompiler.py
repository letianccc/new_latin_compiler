
from front_.lexer_ import Lexer
from front_.parser_ import Parser
# import type_system
from front_.type_system import TypeSystem
from front_.symbol_system import SymbolSystem
from front_.util import *
from front_.myenum import *
import os
from front_.emitor import Emit



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
        f.identifier.check(f, NodeKind.FUNCTION, None)

    for f in functions:
        f.check()
    for f in functions:
        for node in f.call_nodes:
            node.check_callee()


    for f in functions:
        f.gen()



    symbols = [f.symbol for f in functions]

    e = Emit(symbols)
    e.execute()
    code = e.code
    # log(code)
    return code
