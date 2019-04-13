


void main() {
    int a1 = 3, a2 = 2, a3 = 1;
    int b1 = 1, b2 = 3, b3;
    int c1, c2, c3;
    printf("target 1: %d\n", a3);
    b3 = 2;
    printf("target 2: %d\n", b3);

    double d1, d2, d3;
    d1 = 3.5;
    printf("target 3.5 : %f\n", d1);
    printf("target 4.5 : %f\n", 4.5);
    printf("target 5   : %d\n", 5);
    printf("target None: None\n");

    func1(1, 2);
    func2(1, 2);
    func3();
    func4(1);
    getchar();
}



void func1(int a, int b) {
    int a1 = 3, a2 = 2, a3 = 1;
    int b1 = 1, b2 = 3, b3;
    int c1, c2, c3;
    printf("target 1: %d\n", a3);
    b3 = 2;
    printf("target 2: %d\n", b3);

    double d1, d2, d3;
    d1 = 3.5;
    printf("target 3.5 : %f\n", d1);
    printf("target 4.5 : %f\n", 4.5);
    printf("target 5   : %d\n", 5);
    printf("target None: None\n");

}

void func2(int a, int b) {
    int c = a;
    printf("target 1: %d\n", a);
    printf("target 2: %d\n", b);
    printf("target 1: %d\n", c);
}

void func3() {

}

void func4(int a) {

}
