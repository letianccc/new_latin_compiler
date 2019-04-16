
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


void main() {
    interger_to_double();
    getchar();
}
