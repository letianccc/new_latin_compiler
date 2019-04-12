
#include<stdio.h>




void main() {
    // int a = 1;
    // int *b = &a;
    // int c = 2;
    // *b = c;
    // printf("target 2: %d\n", a);
    // printf("target 2: %d\n", *b);

    int a = 1;
    int *b = &a;
    int **c = &b;
    int d = 2;
    *b = d;
    printf("target 2: %d\n", *b);
    // **c = 3;
    // printf("target 3: %d\n", **c);

    getchar();
}
