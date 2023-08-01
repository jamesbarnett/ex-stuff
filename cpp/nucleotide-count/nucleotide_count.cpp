#include "nucleotide_count.h"

const std::string NUCLEOTIDES{"ATCG"};

std::map<char, int> nucleotide_count::count(const std::string str) {
  std::map<char, int> counts = std::map<char, int>();

  if (!is_valid(str)) throw std::invalid_argument("Bad character to counter.");

  for (const auto& ch : NUCLEOTIDES) {
    counts[ch] = std::count_if(str.cbegin(), str.cend(),
        [&](const auto& c) { return c == ch; });
  }

  return counts;
}

bool nucleotide_count::is_valid(const std::string str) {
  return std::all_of(str.begin(), str.end(),
    [&](const auto& x) { return NUCLEOTIDES.find_first_of(x) != std::string::npos; });
}

