#include "isogram.h"

#include <cctype>
#include <unordered_set>

std::string filtered_word(const std::string& str) {
    std::string value("");

    for (auto c : str) {
        if (std::isalpha(c)) {
            value.push_back(std::tolower(c));
        }
    }
    return value;
}

bool isogram::is_isogram(const std::string& str) {
    std::unordered_set<char> encountered{};

    for (auto c : filtered_word(str)) {
        if (!encountered.insert(c).second) {
            return false;
        }
        encountered.insert(c);
    }
    return true;
}
