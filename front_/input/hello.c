#include<stdio.h>



void sort(int *a) {
    a[1] = 111;
}

void main() {
    int arr[10] = {3,5,1,7,4,9,6,8,10,4};
    sort(arr);
    int i;
    int len = 10;
    for (i=0; i<len; i=i+1) {
		printf ("%d\n", arr[i]);
	}
	getchar();
}
