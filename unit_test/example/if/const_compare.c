



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

}

void main() {
    const_compare();
    getchar();
}
