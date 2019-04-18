


int func1() {
    return 7;
}

short func2() {
    short a = 70000;
    return a;
}

short func3() {
    int a = 70000;
    return a;
}

void main() {
    int a = func1();
    short b = func2();
    int c = func3();
    printf("target 7: %d\n", a);
    printf("target 4464: %d\n", b);
    printf("target 4464: %d\n", c);
    getchar();
}
