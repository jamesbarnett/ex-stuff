#include "reverse_string.h"
#include <algorithm>
#include <string>

namespace reverse_string {
  std::string reverse_string(std::string str) {
    std::string s(str);
    std::reverse(s.begin(), s.end());

    return s;
  }

  std::string reverse_string(const char* str) {
    return reverse_string(std::string(str));
  }

}  // namespace reverse_string
