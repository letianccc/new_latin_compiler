

void const_logic_compare() {
    int x = 777;
    if (1 < 2 || 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 || 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 || 2 > 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (1 < 2 && 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 && 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (1 < 2 && 2 > 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);


}

void logic_compare() {
    int i1 = 1;
    int i2 = 2;
    int i3 = 3;
    double d1 = 1.1;
    double d2 = 2.1;
    double d3 = 3.1;
    short s1 = 1;
    short s2 = 2;
    short s3 = 3;
    int x;

    x = 777;
    if (i1 < i2 || i2 < i3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > i2 || i2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (i1 > 2 || 2 > i3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (i1 < i2 && 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 && i2 < i3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (i1 < i2 && i2 > 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);



    if (d1 < d2 || d2 < d3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > d2 || d2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (d1 > 2 || 2 > d3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (d1 < d2 && 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 && d2 < d3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (d1 < d2 && d2 > 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    if (s1 < s2 || s2 < s3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > s2 || s2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (s1 > 2 || 2 > s3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (s1 < s2 && 2 < 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1 > 2 && s2 < s3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (s1 < s2 && s2 > 3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (s1 < d2 || d2 < i3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (d1 < s1 && d2 < i3) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (d3 < i2 || s1 < i2) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1.1 < i2 || s1 < 2.1) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

    x = 777;
    if (1.1 < i2 && s1 > 2.1) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

}

void mul_logic() {
    int i1 = 1;
    int i2 = 2;
    int i3 = 3;
    double d1 = 1.1;
    double d2 = 2.1;
    double d3 = 3.1;
    short s1 = 1;
    short s2 = 2;
    short s3 = 3;
    int x;

    x = 777;
    if (((1 < 2) || (2 < 3)) && ((3 < 4) && (2 > 3))) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (((1 < 2) || (2 < i3)) && ((3 < 4) && (2 > 3))) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 0: %d\n", x);

    x = 777;
    if (((i1 < s2) || (s2 < i3)) && ((d3 < 4) && (d3 > 2))) {
        x = 1;
    } else {
        x = 0;
    }
    printf("target 1: %d\n", x);

}

void main() {
    const_logic_compare();
    logic_compare();
    mul_logic();
    getchar();
}
