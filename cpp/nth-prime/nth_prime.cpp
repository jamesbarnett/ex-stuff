#include "nth_prime.h"
#include <iostream>
#include <numeric>
#include <algorithm>
#include <vector>
#include <stdexcept>
#include <cmath>

template <typename T>
std::vector<T> take(int n) {
  std::vector<T> ns(n);
  std::iota(ns.begin(), ns.end(), 1);
  return ns;
}

namespace nth_prime {
  std::size_t is_prime(std::size_t n) {
    std::vector<std::size_t> primes(sieve(n));

    return std::none_of(primes.begin(), primes.end(),
        [=](auto& c) { return n % c == 0; });
  }

  std::size_t nth(std::size_t n) {
    if (n == 0UL) throw std::domain_error("Zero is bad!");
     
    static std::vector<size_t> primes;

    if (n < primes.size()) {
      std::cout << "Sieve is fine: " << n << " -> " << primes.size() << "\n";
      return primes.at(n - 1);
    } else {
      size_t cx;
      size_t count = 0; 
      while (primes.size() <= n) {
        cx = std::max(n * 2 * (count + 1), 10000ul);
        primes = sieve(cx);
        ++count;
      }
    }

    return primes.at(n - 1);
  }

  std::vector<std::size_t> sieve(std::size_t n) {
    std::vector<std::size_t> primes;

    for (std::size_t i = 2; i <= n; ++i) {
      if (primes.size() == 0 || std::none_of(primes.cbegin(), primes.cend(),
            [=](auto& c) { return i % c == 0; })) {
        primes.push_back(i);
      }

      for (std::size_t j = 2; j < i; ++j) {
        if (n % j == 0) break;
      }
    }
    
    return primes;
  }
}

