

void main() {
    int a = 1;
    int b = &a;
    int c = *b;
    printf("target 1: %d\n", a);
    printf("pointer : %d\n", b);
    printf("target 1: %d\n", c);
    getchar();
}
