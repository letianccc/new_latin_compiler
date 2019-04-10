


void main() {
    int a = 7;
	int *p = &a;
	int **pp = &p;
	printf("pointer  : %d\n", p);
	printf("pointer  : %d\n", pp);
	printf("*target 7: %d\n", *p);
	// printf("*pp %d\n", *pp);
	// printf("**pp %d\n", **pp);
    getchar();
}
