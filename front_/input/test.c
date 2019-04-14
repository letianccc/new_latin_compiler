

void swap1(int a, int b) {
    int c;
    c = a;
    a = b;
    b = c;
}

void swap2(int *a, int *b) {
    int c;
    c = *a;
    *a = *b;
    *b = c;
}

void swap() {
    int a = 1;
    int b = 2;
    swap1(a, b);
    printf("target 1: %d\n", a);
    printf("target 2: %d\n", b);
    swap2(&a, &b);
    printf("target 2: %d\n", a);
    printf("target 1: %d\n", b);
}

void func1(int *a) {
    printf("target 1: %d\n", *a);
}

void pass_pointer() {
    int a = 1;
    int *b = &a;
    func1(b);
}


void mul_indirect_assign() {
    int a = 1;
    int *b = &a;
    int **c = &b;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);
    printf("target 1: %d\n", **c);
    **c = 2;
    printf("target 2: %d\n", a);
    printf("target 2: %d\n", *b);
    printf("target 2: %d\n", **c);
}

void main() {

    pass_pointer();

    swap();

    mul_indirect_assign();
    getchar();

}
