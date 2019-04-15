

void main() {
    int a = 1;
    if (a == 1) {
        int a = 2;
        printf("target 2: %d\n", a);
    }
    printf("target 1: %d\n", a);
    getchar();
}
