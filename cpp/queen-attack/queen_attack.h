#if !defined(QUEEN_ATTACK_H)
#define QUEEN_ATTACK_H

#include <utility>
#include <string>
#include <sstream>

namespace queen_attack {
  struct chess_board {
    std::pair<int, int> white_;
    std::pair<int, int> black_;
    const std::pair<int, int>& white() const { return white_; }
    const std::pair<int, int>& black() const { return black_; }
    chess_board(std::pair<int, int> white, std::pair<int, int> black);
    chess_board() : white_(std::make_pair(0, 3)), black_(std::make_pair(7, 3)) {}

    bool can_attack() const {
      return same_row() || same_column() || diagonal();
    }

    explicit operator std::string() const { return to_string(); }
    bool same_row() const {
      return white_.first == black_.first;
    }

    bool same_column() const {
      return white_.second == black_.second;
    }
  
    bool diagonal() const {
      for (int i = 0; i < 8; ++i) {
        if (black_.first + i == white_.first &&
            black_.second + i == white_.second) {
          return true;
        }

        if (black_.first + i == white_.first &&
            black_.second - i == white_.second) {
          return true;
        }

        if (black_.first - i == white_.first &&
            black_.second + i == white_.second) {
          return true;
        }

        if (black_.first - i == white_.first &&
            black_.second - i == white_.second) {
          return true;
        }
      }
      
      return false;
    } 

    std::string to_string() const {
      std::string str;

      for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
          if (std::make_pair(i, j) == white_) {
            str.append("W");
          } else if (std::make_pair(i, j) == black_) {
            str.append("B");
          } else {
            str.append("_");
          }

          if (j == 7) {
            str.append("\n");
          } else {
            str.append(" ");
          }
        }
      }

      return str;
    }
  };
}  // namespace queen_attack

#endif // QUEEN_ATTACK_H
