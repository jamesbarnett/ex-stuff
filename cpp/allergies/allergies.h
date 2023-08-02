#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <string>
#include <map>
#include <unordered_set>
#include <algorithm>

namespace allergies {
  struct allergy_test {
    int points_;
    std::unordered_set<std::string> allergens_;

    const std::map<std::string, int> allergen_map_ = {
      {"eggs", 1},
      {"peanuts", 2},
      {"shellfish", 4},
      {"strawberries", 8},
      {"tomatoes", 16},
      {"chocolate", 32},
      {"pollen", 64},
      {"cats", 128}
    };

    explicit allergy_test(const int points) : points_(points), allergens_{} {
      for (int i = 0; i < 8; ++i) {
        if ((points & (1 << i)) != 0) {
          auto it = find_if(allergen_map_.begin(), allergen_map_.end(),
            [=](const auto& e) { return (e.second & (1 << i)) != 0; });
          allergens_.insert(it->first);
        }
      }
    }

    std::unordered_set<std::string> get_allergies() {
      return allergens_;
    }

    bool is_allergic_to(std::string allergen) {
      return ((points_ & allergen_map_.at(allergen)) != 0);
    }
  };
}

#endif
