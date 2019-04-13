

void binary_arith() {
    double a = 1.2;
    double b = 1.1;
    double c = a + b;
    double d = a - b;
    double e = a * b;
    printf("target 2.3: %f\n", c);
    printf("target 0.1: %f\n", d);
    printf("target 1.32: %f\n", e);
}

void add() {
    double a = 1.1;
    double d = 1.1 + 1.1 + 1.1;
    double e = a + 1.1 + 1.1;
    double f = 1.1 + a + 1.1;
    double g = 1.1 + 1.1 + a;
    double h = a + a + 1.1;
    double i = 1.1 + a + a;
    double j = a + 1.1 + a;
    double k = a + a + a;
    double l = 1.1 + 1.1;
    double m = a + 1.1;
    double n = 1.1 + a;
    double o = a + a;

    printf("target 3.3: %f\n", d);
    printf("target 3.3: %f\n", e);
    printf("target 3.3: %f\n", f);
    printf("target 3.3: %f\n", g);
    printf("target 3.3: %f\n", h);
    printf("target 3.3: %f\n", i);
    printf("target 3.3: %f\n", j);
    printf("target 3.3: %f\n", k);

    printf("target 2.2: %f\n", l);
    printf("target 2.2: %f\n", m);
    printf("target 2.2: %f\n", n);
    printf("target 2.2: %f\n", o);
}

void sub() {
    double a = 1.1;
    double b = 1.1;
    double c = 1.1;
    double d = 1.1 - 1.1 - 1.1;
    double e = a - 1.1 - 1.1;
    double f = 1.1 - b - 1.1;
    double g = 1.1 - 1.1 - c;
    double h = a - b - 1.1;
    double i = 1.1 - b - c;
    double j = a - 1.1 - c;
    double k = a - b - c;
    double l = 1.1 - 1.1;
    double m = a - 1.1;
    double n = 1.1 - b;
    double o = a - b;

    printf("target -1.1: %f\n", d);
    printf("target -1.1: %f\n", e);
    printf("target -1.1: %f\n", f);
    printf("target -1.1: %f\n", g);
    printf("target -1.1: %f\n", h);
    printf("target -1.1: %f\n", i);
    printf("target -1.1: %f\n", j);
    printf("target -1.1: %f\n", k);

    printf("target 0: %f\n", l);
    printf("target 0: %f\n", m);
    printf("target 0: %f\n", n);
    printf("target 0: %f\n", o);
}

void mul() {
    double a = 1.1;
    double b = 1.1;
    double c = 1.1;
    double d = 1.1 * 1.1 * 1.1;
    double e = a * 1.1 * 1.1;
    double f = 1.1 * b * 1.1;
    double g = 1.1 * 1.1 * c;
    double h = a * b * 1.1;
    double i = 1.1 * b * c;
    double j = a * 1.1 * c;
    double k = a * b * c;
    double l = 1.1 * 1.1;
    double m = a * 1.1;
    double n = 1.1 * b;
    double o = a * b;

    printf("target 1.331: %f\n", d);
    printf("target 1.331: %f\n", e);
    printf("target 1.331: %f\n", f);
    printf("target 1.331: %f\n", g);
    printf("target 1.331: %f\n", h);
    printf("target 1.331: %f\n", i);
    printf("target 1.331: %f\n", j);
    printf("target 1.331: %f\n", k);

    printf("target 1.21: %f\n", l);
    printf("target 1.21: %f\n", m);
    printf("target 1.21: %f\n", n);
    printf("target 1.21: %f\n", o);
}

void main() {
    binary_arith();
    add();
    sub();
    mul();
    getchar();
}
