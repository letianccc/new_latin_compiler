
void interger_to_double() {
    double a1;
    a1 = 1;
    printf("target 1: %f\n", a1);

    double a2 = 1;
    printf("target 1: %f\n", a2);

    int b1 = 1;
    double a3;
    a3 = b1;
    printf("target 1: %f\n", a3);

    double a4 = b1;
    printf("target 1: %f\n", a4);

    short b2 = 1;
    double a5;
    a5 = b2;
    printf("target 1: %f\n", a5);

    double a6 = b2;
    printf("target 1: %f\n", a6);

}

void double_to_integer() {
    int a1 = 1.5;
    printf("target 1: %d\n", a1);

    int a2;
    a2 = 1.5;
    printf("target 1: %d\n", a2);

    short a3 = 1.5;
    printf("target 1: %d\n", a3);

    short a4;
    a4 = 1.5;
    printf("target 1: %d\n", a4);

    double b1 = 1.5;
    int a5 = b1;
    printf("target 1: %d\n", a5);

    int a6;
    a6 = b1;
    printf("target 1: %d\n", a6);

    short a7 = b1;
    printf("target 1: %d\n", a7);

    short a8;
    a8 = b1;
    printf("target 1: %d\n", a8);

}

void main() {
    interger_to_double();
    double_to_integer();
    getchar();
}
