

void assign_boolean() {
    int i1;
    i1 = 1 < 2 && 2 < 3;
    printf("target 1: %d\n", i1);

    int i2 = 1 < 2 && 2 < 3;
    printf("target 1: %d\n", i2);

    int a = 777;
    int *b = &a;
    printf("target 777: %d\n", a);
    printf("target 777: %d\n", *b);
    *b = 1 < 2 && 2 < 3;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);
}

void main() {
    assign_boolean();
    getchar();
}
