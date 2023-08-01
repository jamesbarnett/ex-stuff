//#if !defined(NUCLEOTIDE_COUNT_H)
#ifndef NUCLEOTIDE_COUNT_H
#define NUCLEOTIDE_COUNT_H

#include <map>
#include <string>
#include <algorithm>
#include <vector>
#include <stdexcept>

namespace nucleotide_count {
  std::map<char, int> count(const std::string str);
  bool is_valid(const std::string str);
}  // namespace nucleotide_count

#endif // NUCLEOTIDE_COUNT_H
