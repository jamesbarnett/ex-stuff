#if !defined(ANAGRAM_H)
#define ANAGRAM_H
#include <string>
#include <vector>

namespace anagram {
class anagram {
 public:
  explicit anagram(const std::string& word) : word_{word} {}
  std::vector<std::string> matches(const std::vector<std::string>&);

 private:
  std::string word_;
};
}  // namespace anagram

#endif  // ANAGRAM_H
