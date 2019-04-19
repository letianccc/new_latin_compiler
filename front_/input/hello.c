

#include<stdio.h>

int func() {
	return 11;
}

void main() {


	// int a[10];
	// int i = 0;
	// for (i = 0; i < 5; i++) {
	// 	a[i] = 5;
	// }
	// printf("target 1: %d\n", a[i-2]);
	//
	int b[10] = {0};
	int i = 1;
	int j = 1;
	int k = 1;
	// int a = b[i] + (i + j + k);
	b[i+j+k] = b[i+j];
	// i + j + 1
	// int a = b[b[i] + b[j] + b[k]];
	// b[b[i] + b[k] + b[j]] = b[b[i] + b[j] + b[k]];
	// int i = 1;
	// b[i] = 777;
	// int j = 1;
	// b[i+1+j] = b[i+j+j];
	// int c = b[i];


	getchar();
}
