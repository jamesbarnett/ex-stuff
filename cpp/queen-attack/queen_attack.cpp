#include "queen_attack.h"
#include <stdexcept>

namespace queen_attack {
    std::pair<int, int> white_;
    std::pair<int, int> black_;

    chess_board::chess_board(std::pair<int, int> white, std::pair<int, int> black)
      : white_(white), black_(black) {
        if (white == black) throw std::domain_error("Can't be in same spot");
    }
}
