

// void swap1(int a, int b) {
//     int c;
//     c = a;
//     a = b;
//     b = c;
// }
//
// void swap2(int *a, int *b) {
//     int c;
//     c = *a;
//     *a = *b;
//     *b = c;
// }
void pass_pointer(int *a) {
    printf("target 1: %d\n", *a);
}

// void swap() {
//
// }



void mul_indirect_assign() {
    int a = 1;
    int *b = &a;
    int **c = &b;
    printf("target 1: %d\n", a);
    printf("target 1: %d\n", *b);
    printf("target 1: %d\n", **c);
    **c = 2;
    printf("target 2: %d\n", a);
    printf("target 2: %d\n", *b);
    printf("target 2: %d\n", **c);
}

void main() {

    int a = 1;
    int *b = &a;
    pass_pointer(b);

    // int a = 1;
    // int b = 2;
    // swap1(a, b);
    // printf("target 1: %d\n", a);
    // printf("target 2: %d\n", b);
    // swap2(&a, &b);
    // printf("target 1: %d\n", a);
    // printf("target 2: %d\n", b);

    mul_indirect_assign();
    getchar();

}
