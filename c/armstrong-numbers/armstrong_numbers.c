#include "armstrong_numbers.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

bool is_armstrong_number(int candidate) {
  char str[100];
  snprintf(str, sizeof(str), "%d", candidate);

  int length = log10(candidate) + 1;
  int total = 0;

  for (int i = 0; i < length; i++) {
    int val = (int)(str[i] - '0');
    total += (int)pow(val, length);
  }

  return total == candidate;
}

