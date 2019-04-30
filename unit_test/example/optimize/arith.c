
void identity() {
    int a = 1;
    int b1 = a * 0;
    int b2 = a * 1;
    int b3 = 0 - a;
    int b4 = a - 0;
    int b5 = 0 + a;
    int b6 = a + 0;
    int b7 = 0 * a;
    int b8 = 1 * a;

    printf("target 0 : %d\n", b1);
    printf("target 1 : %d\n", b2);
    printf("target -1: %d\n", b3);
    printf("target 1 : %d\n", b4);
    printf("target 1 : %d\n", b5);
    printf("target 1 : %d\n", b6);
    printf("target 0 : %d\n", b7);
    printf("target 1 : %d\n", b8);

}


void add_constant_folding() {
    int ai = 1 + 1;
    printf("target 2: %d\n", ai);
    short as = 1 + 1;
    printf("target 2: %d\n", as);
    double ad = 1.5 + 1;
    printf("target 2.5: %f\n", ad);
}

void sub_constant_folding() {
    int ai = 3 - 1;
    printf("target 2: %d\n", ai);
    short as = 3 - 1;
    printf("target 2: %d\n", as);
    double ad = 3.5 - 1;
    printf("target 2.5: %f\n", ad);
}

void mul_constant_folding() {
    int ai = 2 * 1;
    printf("target 2: %d\n", ai);
    short as = 2 * 1;
    printf("target 2: %d\n", as);
    double ad = 2.5 * 1;
    printf("target 2.5: %f\n", ad);
}

void constant_folding() {
    add_constant_folding();
    sub_constant_folding();
    mul_constant_folding();
}

void reduction() {
    int a = 1;
    int b = a * 2;
    printf("target 2: %d\n", b);
}

void main() {
    constant_folding();
    reduction();
    identity();
	getchar();
}
