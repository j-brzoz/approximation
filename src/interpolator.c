#include <stdio.h>
#include "makespl.h"
void
make_spl (points_t * pts, spline_t * spl){
    int i, j;
	int n = pts->n;
	n--;
    
	double h[n], A[n], l[n + 1], u[n + 1], z[n + 1], f[n], ff[n + 1], fff[n];

	double *x = pts->x;
	double *y = pts->y;
	
    for (i = 0; i <= n - 1; ++i) h[i] = x[i + 1] - x[i];

    for (i = 1; i <= n - 1; ++i){
        A[i] = 3 * (y[i + 1] - y[i]) / h[i] - 3 * (y[i] - y[i - 1]) / h[i - 1];
	}

    l[0] = 1;
    u[0] = 0;
    z[0] = 0;

    for (i = 1; i <= n - 1; ++i) {
        l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * u[i - 1];
        u[i] = h[i] / l[i];
        z[i] = (A[i] - h[i - 1] * z[i - 1]) / l[i];
    }

    l[n] = 1;
    z[n] = 0;
    ff[n] = 0;

    for (j = n - 1; j >= 0; --j) {
        ff[j] = z[j] - u[j] * ff[j + 1];
        f[j] = (y[j + 1] - y[j]) / h[j] - h[j] * (ff[j + 1] + 2 * ff[j]) / 3;
        fff[j] = (ff[j + 1] - ff[j]) / (3 * h[j]);
    }

	spl->n = pts->n;
	if ( alloc_spl (spl, pts->n) == 0 ) {
		for (i = 0; i < n; ++i){
			spl->x[i]= pts->x[i];
			spl->f[i]= pts->y[i];
			spl->f1[i] = f[i];
			spl->f2[i] = ff[i];
			spl->f3[i] = fff[i];
		}
		spl->x[n]= pts->x[n];
			spl->f[n]= pts->y[n];
			spl->f1[n] = 1;
			spl->f2[n] = 0;
			spl->f3[n] = 0;
	}
}