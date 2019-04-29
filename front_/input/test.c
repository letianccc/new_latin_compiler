

void access1() {
	int a[10];
	a[0] = 1;
	int b = a[0];
	int c = a[0] + 1;
	printf("target 1: %d\n", a[0]);
	printf("target 1: %d\n", b);
	printf("target 2: %d\n", c);
}

void access2() {
	int a[10] = { 1, 2, 3, 4, 5, 6};
	int i = 1;
	int j = 1;
	a[i + 1] = a[j + 2] + 1;
	printf("target 5: %d\n", a[2]);

	a[i + 1] = a[j + 2] + a[i];
	printf("target 6: %d\n", a[2]);

}

void init() {
	int a[10] = {3, 4, 5, 6};
	printf("target 3: %d\n", a[0]);
	printf("target 4: %d\n", a[1]);
	printf("target 5: %d\n", a[2]);
	printf("target 6: %d\n", a[3]);
}

void main() {

	access1();
	access2();
	init();

	getchar();
}
