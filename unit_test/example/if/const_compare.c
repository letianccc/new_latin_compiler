



void const_compare() {
    int a1;
    if (2 != 1.1) {
        a1 = 2;
    } else {
        a1 = 3;
    }
	printf("target 2: %d\n", a1);

    int a2;
    if (1.1 != 2) {
        a2 = 2;
    } else {
        a2 = 3;
    }
	printf("target 2: %d\n", a2);

    int i = 1;
    double d = 1.5;
    short s = 1;

    int a3;
    if (d != 2) {
        a3 = 2;
    } else {
        a3 = 3;
    }
	printf("target 2: %d\n", a3);

    int a4;
    if (2 != d) {
        a4 = 2;
    } else {
        a4 = 3;
    }
	printf("target 2: %d\n", a4);

    int a5;
    if (i != 1.1) {
        a5 = 2;
    } else {
        a5 = 3;
    }
	printf("target 2: %d\n", a5);

    int a6;
    if (1.1 != i) {
        a6 = 2;
    } else {
        a6 = 3;
    }
	printf("target 2: %d\n", a6);

    int a7;
    if (s != 1.1) {
        a7 = 2;
    } else {
        a7 = 3;
    }
	printf("target 2: %d\n", a7);

    int a8;
    if (1.1 != s) {
        a8 = 2;
    } else {
        a8 = 3;
    }
	printf("target 2: %d\n", a8);

}

void main() {
    const_compare();
    getchar();
}
