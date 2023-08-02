#include "difference_of_squares.h"
#include <vector>
#include <iterator>
#include <numeric>
#include <functional>

namespace difference_of_squares {
  int sum_of_squares(int n) {
    std::vector<int> ns(n);
    std::iota(ns.begin(), ns.end(), 1);

    std::vector<int> squares;
    std::transform(ns.begin(), ns.end(), std::back_inserter(squares), 
      [](int x) { return x * x; });

    return std::accumulate(squares.begin(), squares.end(), 0, std::plus<>());
  }

  int square_of_sum(int n) {
    std::vector<int> ns(n);
    std::iota(ns.begin(), ns.end(), 1);

    int sum = std::accumulate(ns.begin(), ns.end(), 0, std::plus<>());

    return sum * sum;
  }

  int difference(int n) {
    return square_of_sum(n) - sum_of_squares(n);
  }
}
