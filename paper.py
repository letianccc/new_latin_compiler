def parse_declaration():
    specifier = parse_specifier()
    node = DeclarationNode(specifier)
    while True:
        d = parse_declarator_initialer()
        node.add(d)
        if not match(COMMA):
            break
        next_token()
    return node

def parse_declarator_initialer():
    declarator = parse_declarator()
    init = None
    if match(ASSIGN):
        next_token()
        init = parse_expression()
    d = InitNode(declarator, init)
    return d


def parse_arith():
    expr = parse_term()
    while match(ADD, SUB):
        expr1 = parse_term()
        expr = ArithNode(kind, expr, expr1)
    return expr

def parse_term():
    expr = parse_factor()
    while match(MUL, DIV):
        expr1 = parse_factor()
        expr = TermNode(kind, expr, expr1)
    return expr


class SymbolSystem(object):
    identifiers = None
    __literals = None

    @classmethod
    def init(cls):
        cls.identifiers = IdentifierField()
        cls.__literals = GlobalField()

    @classmethod
    def add(cls, symbol):
        field = self.match_field(symbol)
        field.add(symbol)


    @classmethod
    def find_symbol(cls, kind, value, type=None, level_kind=None):
        field = self.match_field(symbol)
        s = cls.find_from_fields(value, type, level_kind, field)
        return s

    @classmethod
    def enter(cls):
        inner = IdentifierField()
        inner.outside = cls.identifiers
        cls.identifiers = inner

    @classmethod
    def quit(cls):
        cls.identifiers = cls.identifiers.outside

class Block:
    id = 0
    def __init__(self):
        self.irs = []
        self.id = Block.id
        Block.id += 1

    def add_ir(self, ir):
        self.irs.append(ir)


class IR:
    def __init__(self):
        ...

class AssignIR(IR):
    def __init__(self, destination, source):
        super(AssignIR, self).__init__()
        self.kind = OperatorKind.ASSIGN
        self.destination = destination
        self.source = source

class ExprIR(IR):
    def __init__(self, kind, destination, left, right):
        super(ExprIR, self).__init__()
        self.kind = kind
        self.left = left
        self.right = right
        self.destination = destination

def emit_call(self, ir):
    self.emit_params(ir)
    function_tag = f'_{ir.function.value}'
    code = f'    call\t{function_tag}\n'
    self.emit_code(code)
    dst = ir.destination
    if dst is not None:
        if dst.type.match(TypeKind.DOUBLE):
            src = RegSystem.ST
        else:
            src = RegSystem.reg(RegKind.AX, dst.type.size)
        self.emit_mov(dst, src)

def emit_params(self, ir):
    offset = 0
    for p in ir.params:
        dst_type = TypeSystem.max_type(p.type, TypeSystem.INT)
        pos = f'{offset}(%esp)'
        offset += dst_type.size
        dst = MemorySystem.new(pos, dst_type)
        self.assign_core(dst, p)
