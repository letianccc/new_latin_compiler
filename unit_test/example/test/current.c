void bubble() {
	int arr[10] = {3,5,1,7,4,9,6,8,10,4};
	int temp;
    int i, j;
	int len = 10;
    for (i=0; i<len-1; i=i+1) {
		for (j=0; j<len-1-i; j=j+1) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
	}
	for (i=0; i<len; i=i+1) {
		printf ("%d\n", arr[i]);
	}
}

void nest_for() {
	for (int i = 0; i < 5; i=i+1) {
		for (int j = 0; j < 5; j=j+	1) {
			printf("hello\n");
		}
	}
}

void single_for() {
	for (int i = 0; i < 5; i = i+ 1)
		printf("hello\n");
}
