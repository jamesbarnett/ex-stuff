#if !defined(TRIANGLE_H)
#define TRIANGLE_H

#include <stdexcept>
#include <algorithm>
#include <array>

namespace triangle {
  enum class flavor {
    equilateral,
    isosceles,
    scalene
  };

  flavor kind(double s1, double s2, double s3);
}

#endif

