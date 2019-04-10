


int func1() {
    return 7;
}

short func2() {
    short a = 70000;
    return a;
}

void main() {
    int a = func1();
    short b = func2();
    printf("target 7: %d\n", a);
    printf("target 4464: %d\n", b);
    getchar();
}
