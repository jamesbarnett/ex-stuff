#include "triangle.h"

namespace triangle {
  flavor kind(double s1, double s2, double s3) {
    std::array<double, 3> sides{s1, s2, s3};
    std::sort(sides.begin(), sides.end());

    if (sides[0] <= 0) { 
      throw std::domain_error("All sides should be greater than 0.");
    }

    if (sides[0] + sides[1] < sides[2]) { 
      throw std::domain_error("Check for triangle inequality.");
    }

    if (sides[0] == sides[1] && sides[0] == sides[2] && sides[1] == sides[2]) {
      return flavor::equilateral;
    } else if (sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]) {
      return flavor::isosceles;
    }

    return flavor::scalene;
  }
}
