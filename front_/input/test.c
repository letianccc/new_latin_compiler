
void sub() {
    double a = 3.1;
    int i = 1;
    double a1 = 1 - a;
    double a2 = a - 1;
    double a3 = i - a;
    double a4 = a - i;
    double a5 = 1 - 1.1;
    double a6 = 1.1 - 1;
    printf("target -2.1: %f\n", a1);
    printf("target -2.1: %f\n", a3);
    printf("target 2.1 : %f\n", a2);
    printf("target 2.1 : %f\n", a4);
    printf("target -0.1: %f\n", a5);
    printf("target 0.1 : %f\n", a6);

    double b1 = 3.1 - 1 - 1;
    double b2 = 1 - 3.1 - 1;
    double b3 = 1 - 1 - 3.1;

    printf("target 1.1 : %f\n", b1);
    printf("target -3.1: %f\n", b2);
    printf("target -3.1: %f\n", b3);

    double b4 = 1.1 - 1 - 1;
    double b5 = 1 - 1.1 - 1;
    double b6 = 1 - 1 - 1.1;

    printf("target -0.9: %f\n", b4);
    printf("target -1.1: %f\n", b5);
    printf("target -1.1: %f\n", b6);

    double c1 = 3.1 - 1.1 - 1;
    double c2 = 1 - 3.1 - 1.1;
    double c3 = 3.1 - 1 - 1.1;

    printf("target 1   : %f\n", c1);
    printf("target -3.2: %f\n", c2);
    printf("target 1   : %f\n", c3);

    double c4 = 1.1 - 1.1 - 1;
    double c5 = 1 - 1.1 - 1.1;
    double c6 = 1.1 - 1 - 1.1;

    printf("target -1  : %f\n", c4);
    printf("target -1.2: %f\n", c5);
    printf("target -1  : %f\n", c6);

    double b7 = i - 1.1 - 1;
    double b8 = 1 - 1.1 - i;
    double b9 = 1 - i - 1.1;

    printf("target -1.1: %f\n", b7);
    printf("target -1.1: %f\n", b8);
    printf("target -1.1: %f\n", b9);

    double b10 = i - a - 1;
    double b11 = 1 - a - i;
    double b12 = 1 - i - a;

    printf("target -3.1: %f\n", b10);
    printf("target -3.1: %f\n", b11);
    printf("target -3.1: %f\n", b12);

    short s = 1;
    double b13 = s - a - 1;
    double b14 = 1 - a - s;
    double b15 = 1 - s - a;

    printf("target -3.1: %f\n", b13);
    printf("target -3.1: %f\n", b14);
    printf("target -3.1: %f\n", b15);

    double d1 = s - a - i;
    double d2 = i - a - s;
    double d3 = i - s - a;

    printf("target -3.1: %f\n", d1);
    printf("target -3.1: %f\n", d2);
    printf("target -3.1: %f\n", d3);

}


void main() {
    sub();
    getchar();
}
