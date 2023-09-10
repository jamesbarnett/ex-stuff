#include "anagram.h"

#include <algorithm>
#include <iostream>
#include <ranges>

namespace anagram {
namespace {
[[nodiscard]] std::string sorted_copy(const std::string& str) {
  auto sorted{str};
  std::sort(sorted.begin(), sorted.end());
  return sorted;
}

[[nodiscard]] std::string toupper_copy(const std::string& str) {
  std::string result;
  std::transform(str.begin(), str.end(), std::back_inserter(result), ::toupper);
  return result;
}

[[nodiscard]] bool is_anagram(const std::string& word,
                              const std::string& candidate) {
  std::string word_uppercase{toupper_copy(word)};
  std::string candidate_uppercase{toupper_copy(candidate)};

  return word_uppercase != candidate_uppercase &&
         sorted_copy(word_uppercase) == sorted_copy(candidate_uppercase);
}
}  // namespace

[[nodiscard]] std::vector<std::string> anagram::matches(
    const std::vector<std::string>& candidates) {
  std::vector<std::string> results{};

  std::copy_if(candidates.begin(), candidates.end(),
               std::back_inserter(results),
               [this](auto s) { return is_anagram(this->word_, s); });

  return results;
}
}  // namespace anagram
