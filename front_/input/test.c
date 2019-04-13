

void int_to_short() {
    int a = 70000;
    short b = a;
    short c = 70000;
    printf("target 4464: %d\n", b);
    printf("target 4464: %d\n", c);
}

void mix_add() {
    short a = 1;
    short b = 2;
    int c = 3;
    int d = 4;
    short e = a + b;
    int f = a + c;
    int g = c + a;
    printf("target 3: %d\n", e);
    printf("target 4: %d\n", f);
    printf("target 4: %d\n", g);
}

void main() {
    int_to_short();
    mix_add();
    getchar();
}
