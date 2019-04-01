from lexer_ import Lexer
from util import *


def test_lexer():
    code = '  abc123_a a '
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert(tokens[0].name == 'abc123_a')
    assert (tokens[0].type_ == 'identifier')
    assert (tokens[1].name == 'a')
    assert (tokens[1].type_ == 'identifier')

    code = 'abc123_a a 213'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == 'abc123_a')
    assert (tokens[0].type_ == 'identifier')
    assert (tokens[1].name == 'a')
    assert (tokens[1].type_ == 'identifier')
    assert (tokens[2].name == '213')
    assert (tokens[2].type_ == 'number')

    code = '  abc123_a a 123 '
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == 'abc123_a')
    assert (tokens[0].type_ == 'identifier')
    assert (tokens[1].name == 'a')
    assert (tokens[1].type_ == 'identifier')
    assert (tokens[2].name == '123')
    assert (tokens[2].type_ == 'number')

    code = '{int a;}'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == '{')
    assert (tokens[0].type_ == 'symbol')
    assert (tokens[1].name == 'int')
    assert (tokens[1].type_ == 'reserved')
    assert (tokens[2].name == 'a')
    assert (tokens[2].type_ == 'identifier')
    assert (tokens[3].name == ';')
    assert (tokens[3].type_ == 'symbol')
    assert (tokens[4].name == '}')
    assert (tokens[4].type_ == 'symbol')

    code = '{int abc123_a=1<=2;}'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == '{')
    assert (tokens[0].type_ == 'symbol')
    assert (tokens[1].name == 'int')
    assert (tokens[1].type_ == 'reserved')
    assert (tokens[2].name == 'abc123_a')
    assert (tokens[2].type_ == 'identifier')
    assert (tokens[3].name == '=')
    assert (tokens[3].type_ == 'symbol')
    assert (tokens[4].name == '1')
    assert (tokens[4].type_ == 'number')
    assert (tokens[5].name == '<=')
    assert (tokens[5].type_ == 'symbol')
    assert (tokens[6].name == '2')
    assert (tokens[6].type_ == 'number')
    assert (tokens[7].name == ';')
    assert (tokens[7].type_ == 'symbol')
    assert (tokens[8].name == '}')
    assert (tokens[8].type_ == 'symbol')

    code = 'if (a<=1) a=1;'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == 'if')
    assert (tokens[0].type_ == 'reserved')
    assert (tokens[1].name == '(')
    assert (tokens[1].type_ == 'symbol')
    assert (tokens[2].name == 'a')
    assert (tokens[2].type_ == 'identifier')
    assert (tokens[3].name == '<=')
    assert (tokens[3].type_ == 'symbol')
    assert (tokens[4].name == '1')
    assert (tokens[4].type_ == 'number')
    assert (tokens[5].name == ')')
    assert (tokens[5].type_ == 'symbol')
    assert (tokens[6].name == 'a')
    assert (tokens[6].type_ == 'identifier')
    assert (tokens[7].name == '=')
    assert (tokens[7].type_ == 'symbol')
    assert (tokens[8].name == '1')
    assert (tokens[8].type_ == 'number')
    assert (tokens[9].name == ';')
    assert (tokens[9].type_ == 'symbol')

    code = 'if (a<=1&&b==4) a=1;'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == 'if')
    assert (tokens[0].type_ == 'reserved')
    assert (tokens[1].name == '(')
    assert (tokens[1].type_ == 'symbol')
    assert (tokens[2].name == 'a')
    assert (tokens[2].type_ == 'identifier')
    assert (tokens[3].name == '<=')
    assert (tokens[3].type_ == 'symbol')
    assert (tokens[4].name == '1')
    assert (tokens[4].type_ == 'number')
    assert (tokens[5].name == '&&')
    assert (tokens[5].type_ == 'symbol')
    assert (tokens[6].name == 'b')
    assert (tokens[6].type_ == 'identifier')
    assert (tokens[7].name == '==')
    assert (tokens[7].type_ == 'symbol')
    assert (tokens[8].name == '4')
    assert (tokens[8].type_ == 'number')
    assert (tokens[9].name == ')')
    assert (tokens[9].type_ == 'symbol')
    assert (tokens[10].name == 'a')
    assert (tokens[10].type_ == 'identifier')
    assert (tokens[11].name == '=')
    assert (tokens[11].type_ == 'symbol')
    assert (tokens[12].name == '1')
    assert (tokens[12].type_ == 'number')
    assert (tokens[13].name == ';')
    assert (tokens[13].type_ == 'symbol')

    code = 'if (a<=1&b==4) a=1;'
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    assert (tokens[0].name == 'if')
    assert (tokens[0].type_ == 'reserved')
    assert (tokens[1].name == '(')
    assert (tokens[1].type_ == 'symbol')
    assert (tokens[2].name == 'a')
    assert (tokens[2].type_ == 'identifier')
    assert (tokens[3].name == '<=')
    assert (tokens[3].type_ == 'symbol')
    assert (tokens[4].name == '1')
    assert (tokens[4].type_ == 'number')
    assert (tokens[5].name == '&')
    assert (tokens[5].type_ == 'symbol')
    assert (tokens[6].name == 'b')
    assert (tokens[6].type_ == 'identifier')
    assert (tokens[7].name == '==')
    assert (tokens[7].type_ == 'symbol')
    assert (tokens[8].name == '4')
    assert (tokens[8].type_ == 'number')
    assert (tokens[9].name == ')')
    assert (tokens[9].type_ == 'symbol')
    assert (tokens[10].name == 'a')
    assert (tokens[10].type_ == 'identifier')
    assert (tokens[11].name == '=')
    assert (tokens[11].type_ == 'symbol')
    assert (tokens[12].name == '1')
    assert (tokens[12].type_ == 'number')
    assert (tokens[13].name == ';')
    assert (tokens[13].type_ == 'symbol')


test_lexer()
