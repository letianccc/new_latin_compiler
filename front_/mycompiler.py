
from front_.lexer_ import Lexer
from front_.parser_ import Parser
# import type_system
from front_.type_system import TypeSystem
from front_.symbol_system import SymbolSystem
from front_.util import *
from front_.myenum import *
import os
from front_.emitor import Emit
from front_.symbol_system import *
from front_.optimizer import *
from front_.node.AST import Node


def compile(input_path, debug=False):
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
        check_function(f)

    for f in functions:
        f.check()
    for f in functions:
        for node in f.call_nodes:
            node.check_callee()
    for f in functions:
        f.symbol.call_nodes = f.call_nodes


    for f in functions:
        f.gen()



    symbols = [f.symbol for f in functions]

    if debug is True:
        path = r'C:\code\new_latin_compiler\front_\input\test.ir'
        write_ir(symbols, path)

    opt = Optimizer(symbols)
    opt.execute()

    if debug is True:
        path = r'C:\code\new_latin_compiler\front_\input\test_optimize.ir'
        write_ir(symbols, path)

    e = Emit(symbols)
    e.execute()
    code = e.code
    # log(code)
    return code

def write_ir(functions, path):
    data = ''
    for f in functions:
        for b in f.blocks:
            name = b.access_name()
            data += f'{name}:\n'
            irs = []
            for ir in b.irs:
                ir = ir.format()
                if ir is not None:
                    data += ir
    with open(path, 'w') as f:
        f.write(data)

def check_function(function):
    f = function
    ident = f.identifier
    s = SymbolSystem.find_symbol(SymbolKind.FUNCTION, ident.value)
    if s is not None:
        raise Exception("重复定义")

    s = FunctionSymbol(f.type, ident.value)
    SymbolSystem.add(s)
    f.symbol = s
