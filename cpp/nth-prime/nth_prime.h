#if !defined(NTH_PRIME_H)
#define NTH_PRIME_H

#include <vector>

namespace nth_prime {
  std::size_t nth(std::size_t n);

  std::vector<std::size_t> sieve(std::size_t n);  
}  // namespace nth_prime

#endif // NTH_PRIME_H
