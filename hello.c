
#include<stdio.h>

void func(float a) {
    float b = 3.5;
    float c = 4.5;
}

void main() {
    // int b = 3;
    float a = 1.5;
    float b = a;
    float c = 2.5;
    func(c);
    printf("aaa%f\n", c);
    getchar();
}
