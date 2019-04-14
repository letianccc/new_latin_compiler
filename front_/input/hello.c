#include<stdio.h>

short func() {
    return 1;
}
void main() {
    int b = 2;
    int a = b + func();
    getchar();
}
