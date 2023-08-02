#if !defined(SUM_OF_MULTIPLES_H)
#define SUM_OF_MULTIPLES_H

#include <vector>
#include <numeric>
#include <unordered_set>

namespace sum_of_multiples {
  inline size_t to(std::vector<size_t> factors, size_t limit) {
    std::unordered_set<size_t> multiples;

    for (const auto& factor : factors) {
      auto i = 1;

      while (i * factor < limit) {
        multiples.insert(i * factor);
        ++i;
      }
    }

    return std::accumulate(multiples.begin(), multiples.end(), 0);
  }
}  // namespace sum_of_multiples

#endif // SUM_OF_MULTIPLES_H
