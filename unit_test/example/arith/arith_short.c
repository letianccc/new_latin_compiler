



void add() {
    short a = 1;
    short b = 1 + 1 + 1;
    short c = a + 1 + 1;
    short d = 1 + a + 1;
    short e = 1 + 1 + a;
    short f = a + a + 1;
    short g = 1 + a + a;
    short h = a + 1 + a;
    short i = a + a + a;
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
    short a = 1;
    short b = 1 - 1 - 1;
    short c = a - 1 - 1;
    short d = 1 - a - 1;
    short e = 1 - 1 - a;
    short f = a - a - 1;
    short g = 1 - a - a;
    short h = a - 1 - a;
    short i = a - a - a;
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
    short a = 1;
    short a1 = 1 + 1 - 1;
    short a2 = 1 - 1 + 1;
    short a3 = a - 1 + 1;
    short a4 = 1 - a + 1;
    short a5 = 1 - 1 + a;
    short a6 = a + 1 - 1;
    short a7 = 1 + a - 1;
    short a8 = 1 + 1 - a;
    short a9 = a - a + 1;
    short a10 = 1 - a + a;
    short a11 = a - 1 + a;
    short a12 = a + a - 1;
    short a13 = 1 + a - a;
    short a14 = a + 1 - a;
    short a15 = a + a - a;
    short a16 = a - a + a;
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
    short a = 2;
    short b = 2 * 2 * 2;
    short c = a * 2 * 2;
    short d = 2 * a * 2;
    short e = 2 * 2 * a;
    short f = a * a * 2;
    short g = 2 * a * a;
    short h = a * 2 * a;
    short i = a * a * a;
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

void arith() {
    short a = 2;
    short a1 = 2 * 2 + 2 + 2;
    short a2 = 2 + 2 * 2 + 2;
    short a3 = 2 + 2 + 2 * 2;
    short a4 = a * 2 + 2 + 2;
    short a5 = 2 + 2 * a + 2;
    short a6 = 2 + 2 + a * 2;
    short a7 = a + a * a + a;
    printf("\narith target: 8\n");
    printf("value1: %d\n", a1);
    printf("value2: %d\n", a2);
    printf("value3: %d\n", a3);
    printf("value4: %d\n", a4);
    printf("value5: %d\n", a5);
    printf("value6: %d\n", a6);
    printf("value7: %d\n", a7);
}
void main() {
    add();
    sub();
    add_sub();
    mul();
    arith();
    getchar();
}
