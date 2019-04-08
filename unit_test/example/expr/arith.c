


void add() {
    int a = 1;
    int b = 1 + 1 + 1;
    int c = a + 1 + 1;
    int d = 1 + a + 1;
    int e = 1 + 1 + a;
    int f = a + a + 1;
    int g = 1 + a + a;
    int h = a + 1 + a;
    int i = a + a + a;
    printf("\nadd target: 3\n");
    printf("value1: %d\n", b);
    printf("value2: %d\n", c);
    printf("value3: %d\n", d);
    printf("value4: %d\n", e);
    printf("value5: %d\n", f);
    printf("value6: %d\n", g);
    printf("value7: %d\n", h);
    printf("value8: %d\n", i);
}

void sub() {
    int a = 1;
    int b = 1 - 1 - 1;
    int c = a - 1 - 1;
    int d = 1 - a - 1;
    int e = 1 - 1 - a;
    int f = a - a - 1;
    int g = 1 - a - a;
    int h = a - 1 - a;
    int i = a - a - a;
    printf("\nsub target: -1\n");
    printf("value1: %d\n", b);
    printf("value2: %d\n", c);
    printf("value3: %d\n", d);
    printf("value4: %d\n", e);
    printf("value5: %d\n", f);
    printf("value6: %d\n", g);
    printf("value7: %d\n", h);
    printf("value8: %d\n", i);
}

void add_sub() {
    int a = 1;
    int a1 = 1 + 1 - 1;
    int a2 = 1 - 1 + 1;
    int a3 = a - 1 + 1;
    int a4 = 1 - a + 1;
    int a5 = 1 - 1 + a;
    int a6 = a + 1 - 1;
    int a7 = 1 + a - 1;
    int a8 = 1 + 1 - a;
    int a9 = a - a + 1;
    int a10 = 1 - a + a;
    int a11 = a - 1 + a;
    int a12 = a + a - 1;
    int a13 = 1 + a - a;
    int a14 = a + 1 - a;
    int a15 = a + a - a;
    int a16 = a - a + a;
    printf("\nadd and sub target: 1\n");
    printf("value1: %d\n", a1);
    printf("value2: %d\n", a2);
    printf("value3: %d\n", a3);
    printf("value4: %d\n", a4);
    printf("value5: %d\n", a5);
    printf("value6: %d\n", a6);
    printf("value7: %d\n", a7);
    printf("value8: %d\n", a8);
    printf("value9: %d\n", a9);
    printf("value10: %d\n", a10);
    printf("value11: %d\n", a11);
    printf("value12: %d\n", a12);
    printf("value13: %d\n", a13);
    printf("value14: %d\n", a14);
    printf("value15: %d\n", a15);
    printf("value16: %d\n", a16);
}

void mul() {
    int a = 2;
    int b = 2 * 2 * 2;
    int c = a * 2 * 2;
    int d = 1 * a * 2;
    int e = 2 * 2 * a;
    int f = a * a * 2;
    int g = 2 * a * a;
    int h = a * 2 * a;
    int i = a * a * a;
    printf("\nmul target: 8\n");
    printf("value1: %d\n", b);
    printf("value2: %d\n", c);
    printf("value3: %d\n", d);
    printf("value4: %d\n", e);
    printf("value5: %d\n", f);
    printf("value6: %d\n", g);
    printf("value7: %d\n", h);
    printf("value8: %d\n", i);
}


void main() {
    add();
    sub();
    add_sub();
    mul();
    getchar();
}
