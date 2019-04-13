


void main() {
    int a = 7;
	int *p = &a;
	int **pp = &p;
	// printf("pointer p  : %d\n", p);
	// printf("pointer &p : %d\n", pp);
	printf("*p == 7    : %d\n", *p);
	// printf("*pp == p   : %d\n", *pp);
	printf("**pp == 7  : %d\n", **pp);
    getchar();
}
