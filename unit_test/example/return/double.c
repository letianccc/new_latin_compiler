



double func() {
    return 1.1;
}

double func1() {
    return 1;
}

double func2() {
    int a = 1;
    return a;
}

double func3() {
    double a = 1.1;
    return a;
}

void main() {
    double d1 = func();
    printf("target 1.1: %f\n", d1);

    double d2 = func1();
    printf("target 1: %f\n", d2);

    double d3 = func2();
    printf("target 1: %f\n", d3);

    double d4 = func3();
    printf("target 1.1: %f\n", d4);

    getchar();
}
