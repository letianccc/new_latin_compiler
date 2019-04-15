#include<stdio.h>

void main() {
    double a = 1.5;
    double b = 1.5;
    if (a == b) {
        b = 3;
    }
    printf("target 3: %d\n", b);

    getchar();
}
