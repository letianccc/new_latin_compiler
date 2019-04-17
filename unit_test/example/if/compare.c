
void double_size_compare() {
    double d1 = 1.1;
    double d2 = 2.1;
    int t;

    t = 777;
    if (d1 < d2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d1 <= d2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d2 > d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d2 >= d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (2.1 > d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d1 < 2.1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1.1 < 2.1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

}

void short_size_compare() {
    short s1 = 1;
    short s2 = 2;
    int t;

    t = 777;
    if (s1 < s2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (s1 <= s2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (s2 > s1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (s2 >= s1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);


}

void int_size_compare() {
    int i1 = 1;
    int i2 = 2;
    short s1 = 1;
    short s2 = 2;
    double d1 = 1;
    double d2 = 2;
    int t;

    t = 777;
    if (i1 < i2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i1 <= i2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i2 > i1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i2 >= i1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1 < 2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1 <= 2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (2 > 1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (2 >= 1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1 < i2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1 <= i2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i1 > 0) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i1 >= 0) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

}

void mix_size_compare() {
    int i1 = 1;
    int i2 = 2;
    double d1 = 1.1;
    double d2 = 2.1;
    short s1 = 1;
    short s2 = 2;
    int t;

    t = 777;
    if (1 < 1.1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (s1 < 1.1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i1 < 1.1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1.1 < 2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (1.1 < i2) {
        t = 1;
    } else {
        t = 0;
    }

    printf("target 1: %d\n", t);
    t = 777;
    if (1.1 < s2) {
        t = 1;
    } else {
        t = 0;
    }

    t = 777;
    if (1 < d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (s1 < d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (i1 < d1) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d1 < 2) {
        t = 1;
    } else {
        t = 0;
    }
    printf("target 1: %d\n", t);

    t = 777;
    if (d1 < i2) {
        t = 1;
    } else {
        t = 0;
    }

    printf("target 1: %d\n", t);
    t = 777;
    if (d1 < s2) {
        t = 1;
    } else {
        t = 0;
    }

    printf("target 1: %d\n", t);
    t = 777;
    if (i1 < s2) {
        t = 1;
    } else {
        t = 0;
    }

    printf("target 1: %d\n", t);
    t = 777;
    if (s1 < i2) {
        t = 1;
    } else {
        t = 0;
    }

}

void main() {
    int_size_compare();
    short_size_compare();
    double_size_compare();
    mix_size_compare();
    getchar();
}
