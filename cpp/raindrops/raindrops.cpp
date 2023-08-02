#include "raindrops.h"

namespace raindrops {
  std::string convert(int n) {
    std::string str("");

    if (n % 3 == 0) {
      str.append("Pling");
    }

    if (n % 5 == 0) {
      str.append("Plang");
    }

    if (n % 7 == 0) {
      str.append("Plong");
    }

    return (str.size() == 0) ? std::to_string(n) : str;
  }  // namespace raindrops
}  // namespace raindrops

