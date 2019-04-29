

void simple_minus() {
    int ai = 1;
    int bi = - ai;
    short as = 1;
    short bs = -as;
    double ad = 1;
	double bd = -ad;
    printf("target -1: %d\n", bi);
    printf("target -1: %d\n", bs);
    printf("target -1.0: %f\n", bd);

}

void mix_minus() {
    int ai = 1;
    short as = 1;
    double ad = 1;
    int bi = -as;
    short bs = -ad;
    double bd = -ai;
    printf("target -1: %d\n", bi);
    printf("target -1: %d\n", bs);
    printf("target -1.0: %f\n", bd);
}

void main() {

    simple_minus();
    mix_minus();

	getchar();
}
