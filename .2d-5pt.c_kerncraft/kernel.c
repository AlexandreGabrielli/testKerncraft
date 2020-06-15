#include "kerncraft.h"

void kernel(double *a, double *b, double *s, const int M, const int N)
{
  for (int j = 1; j < (M - 1); ++j)
    for (int i = 1; i < (N - 1); ++i)
    b[i + (j * N)] = (((a[(i - 1) + (j * N)] + a[(i + 1) + (j * N)]) + a[i + ((j - 1) * N)]) + a[i + ((j + 1) * N)]) * *s;


}

