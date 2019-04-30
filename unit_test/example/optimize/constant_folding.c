

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


void main() {
    add_constant_folding();
    sub_constant_folding();
    mul_constant_folding();
	getchar();
}
