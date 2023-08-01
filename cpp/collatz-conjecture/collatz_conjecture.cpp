#include "collatz_conjecture.h"

#include <stdexcept>

namespace collatz_conjecture {
  int steps(int n) {
    if (n <= 0) throw std::domain_error("non-zero values only");
    int i = 0;

    while (n > 1) {
      if (n == 1) {
        n = 0;
      } else if (n % 2 == 0) {
        n = n / 2;
      } else {
        n = 3 * n + 1;
      }
      ++i;
    }

    return i;
  }
}  // namespace collatz_conjecture

