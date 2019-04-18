void int_const() {
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

void double_const() {
    int i1;
    i1 = 1.1 < 2.1 && 2.1 < 3.1;
    printf("target 1: %d\n", i1);

    int i2 = 1.1 < 2.1 && 2.1 < 3.1;
    printf("target 1: %d\n", i2);

    int a = 777;
    int *b = &a;
    printf("target 777: %d\n", a);
    printf("target 777: %d\n", *b);
    *b = 1.1 < 2.1 && 2.1 < 3.1;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);
}

void double_mix() {
    int i1;
    double d1 = 1.1;
    double d2 = 2.1;
    double d3 = 3.1;

    i1 = 777;
    i1 = 1.1 < d2 && d2 < 3.1;
    printf("target 1: %d\n", i1);

    i1 = 777;
    i1 = 1.1 < d2 || d2 < 3.1;
    printf("target 1: %d\n", i1);

    i1 = 777;
    i1 = 1.1 > d2 || d2 > 3.1;
    printf("target 0: %d\n", i1);

    i1 = 777;
    i1 = d1 < 2.1 && 2.1 < d3;
    printf("target 1: %d\n", i1);

    i1 = 777;
    i1 = d1 < d2 && d2 < d3;
    printf("target 1: %d\n", i1);

    int a = 777;
    int *b = &a;
    printf("target 777: %d\n", a);
    printf("target 777: %d\n", *b);
    *b = 1.1 < d2 && d2 < 3.1;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);
}
