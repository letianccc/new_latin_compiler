
void identity() {
    int a = 1;
    int b1 = a * 0;
    int b2 = a * 1;
    int b3 = 0 - a;
    int b4 = a - 0;
    int b5 = 0 + a;
    int b6 = a + 0;
    int b7 = 0 * a;
    int b8 = 1 * a;

    printf("target 0 : %d\n", b1);
    printf("target 1 : %d\n", b2);
    printf("target -1: %d\n", b3);
    printf("target 1 : %d\n", b4);
    printf("target 1 : %d\n", b5);
    printf("target 1 : %d\n", b6);
    printf("target 0 : %d\n", b7);
    printf("target 1 : %d\n", b8);

}




void main() {
    identity();
	getchar();
}
