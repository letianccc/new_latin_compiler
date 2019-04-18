

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

void integer_mix() {

    int t;
    int i1 = 1;
    int i2 = 2;
    int i3 = 3;
    short s1 = 1;
    short s2 = 2;
    short s3 = 3;
    int a;
    int *b;

    t = 777;
    t = 1 < i2 && i2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = 1 < i2 || i2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = 1 > i2 || i2 > 3;
    printf("target 0: %d\n", t);

    t = 777;
    t = i1 < 2 && 2 < i3;
    printf("target 1: %d\n", t);

    t = 777;
    t = i1 < i2 && i2 < i3;
    printf("target 1: %d\n", t);

    a = 777;
    b = &a;
    printf("target 777: %d\n", a);
    printf("target 777: %d\n", *b);
    *b = 1 < i2 && i2 < 3;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);


    t = 777;
    t = 1 < s2 && s2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = 1 < s2 || s2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = 1 > s2 || s2 > 3;
    printf("target 0: %d\n", t);

    t = 777;
    t = s1 < 2 && 2 < s3;
    printf("target 1: %d\n", t);

    t = 777;
    t = s1 < s2 && s2 < s3;
    printf("target 1: %d\n", t);

    a = 777;
    b = &a;
    printf("target 777: %d\n", a);
    printf("target 777: %d\n", *b);
    *b = 1 < s2 && s2 < 3;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);

}

void mix() {
    int t;
    int i1 = 1;
    int i2 = 2;
    int i3 = 3;
    short s1 = 1;
    short s2 = 2;
    short s3 = 3;
    double d1 = 1.1;
    double d2 = 2.1;
    double d3 = 3.1;
    int a;
    int *b;

    t = 777;
    t = 1.1 < s2 && i2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = d1 < 2 && i2 < s3;
    printf("target 1: %d\n", t);

    t = 777;
    t = s1 < i2 && i2 < d3;
    printf("target 1: %d\n", t);

    t = 777;
    t = s1 < d2 && s2 < 3;
    printf("target 1: %d\n", t);

    t = 777;
    t = (s1 < d2 && s2 > 3) || (d1 < 2 && i2 < s3);
    printf("target 1: %d\n", t);

    t = 777;
    t = (s1 < d2 && s2 > 3) || (d1 < 2 && i2 > s3);
    printf("target 0: %d\n", t);

}

void main() {
    int_const();
    double_const();
    double_mix();
    integer_mix();
    mix();
    getchar();
}
