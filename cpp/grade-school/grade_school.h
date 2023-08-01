#if !defined(GRADE_SCHOOL_H)
#define GRADE_SCHOOL_H

#include <map>
#include <vector>
#include <string>
#include <algorithm>

namespace grade_school {
  struct school {
    mutable std::map<int, std::vector<std::string>> roster_;

    std::map<int, std::vector<std::string>> roster() const {
      return roster_;
    }

    void add(const std::string name, int grade) {
      roster_[grade].push_back(name);
      sort(roster_[grade].begin(), roster_[grade].end());
    }

    std::vector<std::string> grade(const int n) const {
      std::map<int, std::vector<std::string>>::const_iterator iter = roster_.find(n);

      return (iter == roster_.end()) ? std::vector<std::string>() : roster_.at(n);
    }
  };
}  // namespace grade_school

#endif // GRADE_SCHOOL_H
