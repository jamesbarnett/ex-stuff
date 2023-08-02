#include "grains.h"
#include <cmath>
#include <algorithm>
#include <numeric>
#include <functional>

namespace grains {
  unsigned long long square(unsigned long long n) {
    return std::pow(2, n - 1);
  }

  unsigned long long total() {
    // v, i, v, t 
    std::vector<unsigned long long> xs(64);
    std::iota(xs.begin(), xs.end(), 1ULL);
    std::vector<unsigned long long> squares(64);
    std::transform(xs.cbegin(), xs.cend(), squares.begin(),
        [](auto& x) { return square(x); });

    return std::accumulate(squares.begin(), squares.end(), 0ULL,
        std::plus<unsigned long long>());
  }

}  // namespace grains
