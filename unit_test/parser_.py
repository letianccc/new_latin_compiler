from lexer_ import Lexer
from parser_ import Parser
from util import *



def assert_type(node, type_):
    assert(node.__class__.__name__ == type_)

def setup(code):
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    parser = Parser(tokens)
    ast = parser.AST
    return ast

def test_parser():
    code = '{int a;a=2;}'
    parser_case1(code)

    code = '{int a[5];a[3]=2;}'
    case10(code)

    code = '{int a;a=2;int b;b=4;}'
    parser_case2(code)

    code = '{int a; a=2; a = a + 2 * 3 + 4;}'
    parser_case7(code)

    code = '{int a; a=2; int b; b=4; a = a + a * (2 + 3) + b;}'
    parser_case6(code)

    code = '{if(a==1)a=1;}'
    parser_case3(code)

    code = '{if(a==1){a=1;}}'
    parser_case4(code)

    code = '{if(a<=3&&b==4){int d;d=1;a=4;}k=4;d=2;}'
    parser_case5(code)

    code = '{int a;a=1;if(a==1)a=2;else a=3;}'
    case8(code)

def case10(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.variable.value == 'a')
    assert(stmt.variable.index.value == '5')
    node = node.next_stmt

    stmt = node
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.variable.value == 'a')
    assert(stmt.variable.index.value == '3')
    assert(stmt.value.value == '2')

def case9(code):
    root = setup(code)
    node = root

    cond = node.cond
    then = node.then
    else_ = node.else_

    assert(node.__class__.__name__ == 'If')
    assert(cond.__class__.__name__ == 'Equal')
    assert(cond.left.value == 'a')
    assert(cond.right.value == '1')
    assert(cond.operator == '==')
    assert(then.__class__.__name__ == 'Assign')
    assert(then.variable.value == 'a')
    assert(then.value.value == '2')
    assert(else_.__class__.__name__ == 'Assign')
    assert(else_.variable.value == 'a')
    assert(else_.value.value == '3')


def parser_case1(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'a')
    node = node.next_stmt

    stmt = node
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '2')


def parser_case2(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'a')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '2')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'b')
    node = node.next_stmt

    stmt = node
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'b')
    assert(stmt.value.value == '4')


def parser_case3(code):
    root = setup(code)
    cond = root.cond
    then = root.then
    else_ = root.else_
    assert(root.__class__.__name__ == 'If')
    assert(cond.__class__.__name__ == 'Equal')
    assert(cond.left.value == 'a')
    assert(cond.right.value == '1')
    assert(cond.operator == '==')
    assert(then.__class__.__name__ == 'Assign')
    assert(then.variable.value == 'a')
    assert(then.value.value == '1')
    assert(else_ == None)


def parser_case4(code):
    root = setup(code)
    cond = root.cond
    then = root.then
    assert(root.__class__.__name__ == 'If')
    assert(cond.__class__.__name__ == 'Equal')
    assert(cond.left.value == 'a')
    assert(cond.right.value == '1')
    assert(cond.operator == '==')
    assert(then.__class__.__name__ == 'Assign')
    assert(then.variable.value == 'a')
    assert(then.value.value == '1')






    # {if(a<=3&&b==4){int d=3;d=1;a=4;}k=4;d=2}


def parser_case5(code):
    root = setup(code)
    if_ = root.stmt
    assert(root.__class__.__name__ == 'Seq')
    assert(if_.__class__.__name__ == 'If')

    cond = if_.cond
    left = cond.left
    right = cond.right
    assert(cond.__class__.__name__ == 'And')
    assert(left.__class__.__name__ == 'Rel')
    assert(left.left.value == 'a')
    assert(left.right.value == '3')
    assert(left.operator == '<=')
    assert(right.__class__.__name__ == 'Equal')
    assert(right.left.value == 'b')
    assert(right.right.value == '4')
    assert(right.operator == '==')

    node = if_.then
    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'd')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'd')
    assert(stmt.value.value == '1')
    node = node.next_stmt

    stmt = node
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '4')

    node = root.next_stmt
    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'k')
    assert(stmt.value.value == '4')

    stmt = node.next_stmt
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'd')
    assert(stmt.value.value == '2')


def parser_case6(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'a')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '2')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'b')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'b')
    assert(stmt.value.value == '4')
    node = node.next_stmt

    stmt = node
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')

    expr = stmt.value
    assert_type(expr, 'Arith')
    assert(expr.operator == '+')
    assert(expr.right.value == 'b')
    expr = expr.left
    assert_type(expr, 'Arith')
    assert(expr.operator == '+')
    assert(expr.left.value == 'a')
    expr = expr.right
    assert_type(expr, 'Arith')
    assert(expr.operator == '*')
    assert(expr.left.value == 'a')
    expr = expr.right
    assert_type(expr, 'Arith')
    assert(expr.operator == '+')
    assert(expr.left.value == '2')
    assert(expr.right.value == '3')


def parser_case7(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert_type(node, 'Seq')
    assert_type(stmt, 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'a')
    node = node.next_stmt

    stmt = node.stmt
    assert_type(node, 'Seq')
    assert_type(stmt, 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '2')
    node = node.next_stmt

    stmt = node
    assert_type(stmt, 'Assign')
    assert(stmt.variable.value == 'a')

    expr = stmt.value
    assert_type(expr, 'Arith')
    assert(expr.operator == '+')
    assert(expr.right.value == '4')
    expr = expr.left
    assert_type(expr, 'Arith')
    assert(expr.operator == '+')
    assert(expr.left.value == 'a')
    expr = expr.right
    assert_type(expr, 'Arith')
    assert(expr.operator == '*')
    assert(expr.left.value == '2')
    assert(expr.right.value == '3')

def case8(code):
    root = setup(code)
    node = root

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'DeclNode')
    assert(stmt.type_ == 'int')
    assert(stmt.variable.value == 'a')
    node = node.next_stmt

    stmt = node.stmt
    assert(node.__class__.__name__ == 'Seq')
    assert(stmt.__class__.__name__ == 'Assign')
    assert(stmt.variable.value == 'a')
    assert(stmt.value.value == '1')
    node = node.next_stmt

    cond = node.cond
    then = node.then
    else_ = node.else_

    assert(node.__class__.__name__ == 'If')
    assert(cond.__class__.__name__ == 'Equal')
    assert(cond.left.value == 'a')
    assert(cond.right.value == '1')
    assert(cond.operator == '==')
    assert(then.__class__.__name__ == 'Assign')
    assert(then.variable.value == 'a')
    assert(then.value.value == '2')
    assert(else_.__class__.__name__ == 'Assign')
    assert(else_.variable.value == 'a')
    assert(else_.value.value == '3')


test_parser()
