

#include<stdio.h>

double func() {
    double d = 7;
    return d;
}

void main() {
    double d;
    d = func();
    printf("target 1: %f\n", d);
    getchar();
}
