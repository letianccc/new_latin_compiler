



void main() {
    int a[5] = {1};
    int *b = &a;
    b[0] = -1;
    printf("target -1: %d\n", a[0]);
	getchar();
}
