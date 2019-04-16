
void num_cmp() {
    int a = 1;
    if (2 == 2) {
        a = 3;
    }
    printf("target 3: %d\n", a);

    int b = 1;
    if (b == 1) {
        b = 3;
    }
    printf("target 3: %d\n", b);

    int c = 1;
    if (1 == c) {
        c = 3;
    }
    printf("target 3: %d\n", c);

    short d = 1;
    if (d == 1) {
        d = 3;
    }
    printf("target 3: %d\n", d);

    short e = 1;
    if (1 == e) {
        e = 3;
    }
    printf("target 3: %d\n", e);

}

void var_cmp() {
    int a1 = 1;
    int b1 = 1;
    if (a1 == b1) {
        b1 = 3;
    }
    printf("target 3: %d\n", b1);

    short a2 = 1;
    short b2 = 1;
    if (a2 == b2) {
        b2 = 3;
    }
    printf("target 3: %d\n", b2);

    int a3 = 1;
    short b3 = 1;
    if (a3 == b3) {
        b3 = 3;
    }
    printf("target 3: %d\n", b3);

    short a4 = 1;
    int b4 = 1;
    if (a4 == b4) {
        b4 = 3;
    }
    printf("target 3: %d\n", b4);

}

void double_cmp() {
    double a1 = 1.5;
    if (a1 == 1.5) {
        a1 = 3.5;
    }
    printf("target 3.5: %f\n", a1);

    double a2 = 1.5;
    if (1.5 == a2) {
        a2 = 3.5;
    }
    printf("target 3.5: %f\n", a2);

    double a3 = 1.5;
    if (a3 == a3) {
        a3 = 3.5;
    }
    printf("target 3.5: %f\n", a3);

    double a4 = 1.5;
    double a5 = 1.5;
    if (a4 == a5) {
        a4 = 3.5;
    }
    printf("target 3.5: %f\n", a4);
}

void main() {
    num_cmp();
    var_cmp();
    double_cmp();
    getchar();
}
