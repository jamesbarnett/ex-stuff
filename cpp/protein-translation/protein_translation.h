#if !defined(PROTEIN_TRANSLATION_H)
#define PROTEIN_TRANSLATION_H

#include <string>
#include <vector>
#include <map>
#include <algorithm>

namespace protein_translation {
  const std::map<std::vector<std::string>, std::string> amino_acids_map_{
    { { "AUG" }, "Methionine" },
    { { "UUU", "UUC" }, "Phenylalanine" },
    { { "UUA", "UUG" }, "Leucine" },
    { { "UCU", "UCC", "UCA", "UCG" }, "Serine" },
    { { "UAU", "UAC" }, "Tyrosine" },
    { { "UGU", "UGC" }, "Cysteine" },
    { { "UGG" }, "Tryptophan" },
    { { "UAA", "UAG", "UGA" }, "STOP" }
  };

  inline std::string get_value(std::string str) {
    for (const auto& [key, value] : amino_acids_map_) {
      auto it = find(key.begin(), key.end(), str);
      if (it != key.end()) {
        return amino_acids_map_.at(key);
      }
    }

    return std::string("");
  }
  
  inline std::vector<std::string> proteins(std::string rna) {
    auto i = 0UL;
    std::vector<std::string> result;

    while (i < rna.size()) {
      auto x = get_value(rna.substr(i, 3));
      if (x == "STOP") {
        return result;
      }

      if (x != "" && (result.end() == find(result.begin(), result.end(), x))) {
        result.push_back(x);
      } 

      i += 3;
    }

    return result;
  }
}  // namespace protein_translation

#endif // PROTEIN_TRANSLATION_H

