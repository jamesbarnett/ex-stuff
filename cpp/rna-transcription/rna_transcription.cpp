#include "rna_transcription.h"

#include <iostream>

namespace rna_transcription {
  char to_rna(const char c) {
    return complements.at(c);
  }

  std::string to_rna(const std::string seq) {
    std::string str = std::accumulate(seq.begin(), seq.end(), std::string(""),
        [](auto& cs, const auto& c) { 
        char co = to_rna(c);
        return cs.append(1UL, co); });
    return str;
  }

  std::string to_rna(const char* str) {
    return to_rna(std::string(str));
  }
}
