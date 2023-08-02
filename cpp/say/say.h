#if !defined(SAY_H)
#define SAY_H

#include <vector>
#include <string>

namespace say {
  std::string in_english(unsigned long long n);
  std::string under1000(int n);
  std::string under_n(int e, unsigned long long x);
  std::string process_tens(int n);
  std::string process_hundreds(int n);
  std::string chomp(std::string str);
  std::string dash_join(std::string sa, std::string sb);
  int power(unsigned long long x);
  unsigned long long pow(unsigned long long x);
}  // namespace say

#endif // SAY_H
