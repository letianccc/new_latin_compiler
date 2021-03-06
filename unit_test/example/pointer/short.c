

void swap1(short a, short b) {
    short c;
    c = a;
    a = b;
    b = c;
}

void swap2(short *a, short *b) {
    short c;
    c = *a;
    *a = *b;
    *b = c;
}

void swap() {
    short a = 70000;
    short b = 80000;
    swap1(a, b);
    printf("target 4464\t: %d\n", a);
    printf("target 14464\t: %d\n", b);
    swap2(&a, &b);
    printf("target 14464\t: %d\n", a);
    printf("target 4464\t: %d\n", b);
}

void func1(short *a) {
    printf("target 4464\t: %d\n", *a);
}

void pass_pointer() {
    short a = 70000;
    short *b = &a;
    func1(b);
}


void mul_indirect_assign() {
    short a = 70000;
    short *b = &a;
    short **c = &b;
    printf("target 4464\t: %d\n", a);
    printf("target 4464\t: %d\n", *b);
    printf("target 4464\t: %d\n", **c);
    **c = 80000;
    printf("target 14464\t: %d\n", a);
    printf("target 14464\t: %d\n", *b);
    printf("target 14464\t: %d\n", **c);
}

void func() {
    short a = 70000;
    short *b = &a;
    printf("target 4464\t: %d\n", a);
    printf("target 4464\t: %d\n", *b);
    int c = 80000;
    *b = c;
    printf("target 14464\t: %d\n", a);
    printf("target 14464\t: %d\n", *b);
}

void main() {
    func();
    pass_pointer();

    swap();

    mul_indirect_assign();
    getchar();

}
