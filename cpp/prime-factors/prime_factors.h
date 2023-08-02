#if !defined(PRIME_FACTORS_H)
#define PRIME_FACTORS_H

#include <vector>
#include <numeric>
#include <string>
#include <algorithm>
#include <cmath>

namespace prime_factors {
  template <typename Iterator>
  size_t prime_sieve(Iterator start, Iterator end) {
    if (start == end) return 0;

    std::fill(start, end, 0);

    for (Iterator prime_it = start + 1; prime_it != end; ++prime_it) {
      if (*prime_it == 1) continue;

      auto stride = (prime_it - start) + 1;

      Iterator mark_it = prime_it;

      while ((end - mark_it) > stride) {
        std::advance(mark_it, stride);
        *mark_it = 1;
      }
    }

    Iterator out_it = start;
    for (Iterator it = start + 1; it != end; ++it) {
      if (*it == 0) {
        *out_it = (it - start) + 1;
        ++out_it;
      }
    }

    return out_it - start;
  }

  inline std::vector<int> primes(int n) {
    std::vector<int> primes(n);
    prime_sieve(primes.begin(), primes.end());

    return primes;
  }

  inline std::vector<int> of(int factor) {
    if (factor == 1) { return {}; }
    std::vector<int> result;
    std::vector<int> ps(primes(factor));

    auto index = 0;

    while (factor == 2 || ps.at(index) <= factor) {
      if (factor % ps.at(index) == 0) {
        factor = factor / ps.at(index);
        result.push_back(ps.at(index));
      } else {
        ++index;
      }
    }

    return result;
  }
}  // namespace prime_factors

#endif // PRIME_FACTORS_H

