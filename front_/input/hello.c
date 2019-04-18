

#include<stdio.h>

short func3() {
    int a = 70000;
    return a;
}

void main() {
    int c = func3();
    printf("target 4464: %d\n", c);
    getchar();
}
