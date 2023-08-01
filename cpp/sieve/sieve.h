#if !defined(SIEVE_H)
#define SIEVE_H

#include <vector>
#include <numeric>
#include <algorithm>

template <typename InputIter, typename OutputIter, class UnaryPredicate>
OutputIter copy_until(InputIter first,
    InputIter last, OutputIter dfirst, UnaryPredicate pred) {
  while (first != last && !pred(*first)) {
    *dfirst = *first;
    ++first;
    ++dfirst;
  }

  return dfirst;
}

namespace sieve {
  inline std::vector<int> primes(int n) {
    if (n == 0 || n == 1) return std::vector<int>{};

    static std::vector<int> _primes{2, 3, 5};
    std::vector<int> result;

    if (_primes.at(_primes.size() - 1) > n) {
      copy_until(_primes.begin(), _primes.end(),
          std::back_inserter(result), [=](const auto& i) { return i > n; });
      return result;
    } else {
      std::vector<int> ns(n - 1);
      std::iota(ns.begin(), ns.end(), 2);

      for (const auto& i : ns) {
        if (std::none_of(_primes.begin(), _primes.end(),
            [=](const auto elem) { return i % elem == 0; })) {
          _primes.push_back(i);
        }
      }

      std::copy(_primes.cbegin(), _primes.cend(), std::back_inserter(result));
    }

    return result;
  }

}  // namespace sieve

#endif // SIEVE_H
