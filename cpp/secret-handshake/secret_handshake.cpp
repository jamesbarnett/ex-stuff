#include "secret_handshake.h"
#include <iostream>
#include <algorithm>
#include <map>

namespace secret_handshake {
  const std::map<int, std::string> code_{
    { 1, "wink" }, { 2, "double blink" }, { 4, "close your eyes" },
    { 8, "jump" }, { 16, "reverse" }
  };

  std::vector<std::string> commands(int n) {
    std::vector<std::string> parts;

    for (auto& v : code_)
    {
      if ((n & v.first) != 0) {
        if (v.first == 16) {
          std::reverse(parts.begin(), parts.end());
        } else {
          parts.push_back(code_.at(v.first));
        }
      }
    }

    return parts;
  }
}

