
#include<stdio.h>










void add() {
    short a = 30000;
    short b = 30000 + 30000 + 30000;
    short c = a + 30000 + 30000;
    short d = 30000 + a + 30000;
    short e = 30000 + 30000 + a;
    short f = a + a + 30000;
    short g = 30000 + a + a;
    short h = a + 30000 + a;
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

void mul() {
    short a = 200;
    short b = 200 * 200 * 200;
    short c = a * 200 * 200;
    short d = 200 * a * 200;
    short e = 200 * 200 * a;
    short f = a * a * 200;
    short g = 200 * a * a;
    short h = a * 200 * a;
    short i = a * a * a;
    printf("\nmul target: 8\n");
    printf("4608: %d\n", b);
    printf("4608: %d\n", c);
    printf("4608: %d\n", d);
    printf("4608: %d\n", e);
    printf("4608: %d\n", f);
    printf("4608: %d\n", g);
    printf("4608: %d\n", h);
    printf("4608: %d\n", i);
}

void arith() {
    short a = 300;
    short a1 = 300 * 300 + 300 + 300;
    short a2 = 300 + 300 * 300 + 300;
    short a3 = 300 + 300 + 300 * 300;
    short a4 = a * 300 + 300 + 300;
    short a5 = 300 + 300 * a + 300;
    short a6 = 300 + 300 + a * 300;
    short a7 = a + a * a + a;
    printf("\narith target: 8\n");
    printf("25064: %d\n", a1);
    printf("25064: %d\n", a2);
    printf("25064: %d\n", a3);
    printf("25064: %d\n", a4);
    printf("25064: %d\n", a5);
    printf("25064: %d\n", a6);
    printf("25064: %d\n", a7);
}

void main() {
    add();
    mul();
    arith();
    getchar();
}
