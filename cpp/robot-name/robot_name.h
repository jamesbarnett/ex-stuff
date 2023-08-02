#if !defined(ROBOT_NAME_H)
#define ROBOT_NAME_H

#include <vector>
#include <string>
#include <numeric>
#include <algorithm>
#include <random>

namespace robot_name {
  struct robot {
    std::string name_;
    static std::vector<std::string> robot_names;

    robot() {
      reset();
    }

    std::string name() const { return name_; }
    std::string& name() { return name_; }
    
    inline void reset() {
      std::remove(robot_names.begin(), robot_names.end(), name_);
      new_name();
      
      while (find(robot_names.begin(), robot_names.end(), name_)
          != robot_names.end()) {
        new_name();
      }

      robot_names.push_back(name_);
    }

    inline void new_name() {
      static std::random_device rd("default");
      static std::mt19937 generator(123);
      static const std::string alphabet("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
      static const std::string numbers("0123456789");
      std::uniform_int_distribution<int> letter_distribution(0, alphabet.size() - 1);
      std::uniform_int_distribution<int> number_distribution(0, numbers.size() - 1);
      name_ = "";

      for (auto i = 0; i < 2; ++i) {
        size_t s = letter_distribution(rd);
        const auto c = alphabet.at(s);
        name_.append(1, c);
      }

      for (auto i = 0; i < 3; ++i) {
        size_t s = number_distribution(rd);
        const auto c = numbers.at(s);
        name_.append(1, c);
      }
    }
  };

}  // namespace robot_name

#endif // ROBOT_NAME_H
