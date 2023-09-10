#include <algorithm>
#include <cassert>
#include <iostream>
#include <numeric>
#include <string>
#include <string_view>
#include <vector>


namespace election {

struct ElectionResult {
  explicit ElectionResult()
    : name{""}
    , votes{0}
    {}

  ElectionResult(std::string s, int v) : name{s}
  , votes{v}
  {}

  std::string name{};
  int votes{};
};

[[nodiscard]]
auto vote_count(ElectionResult& election_result) -> int {
  return election_result.votes;
}

auto increment_vote_count(ElectionResult& er, int votes) -> void {
  er.votes += votes;
}

auto determine_result(std::vector<ElectionResult>& ers)
  -> ElectionResult& {
    std::vector<int> votes;
    std::transform(ers.begin(), ers.end()
        , std::back_inserter(votes), [](auto const x) {
        return x.votes;
        });

    int winning_vote_count = std::accumulate(votes.cbegin()
        , votes.cend(), 0, [](auto x, auto acc) {
        return std::max(x, acc);
        });

    std::vector<ElectionResult>::iterator winner_iter
      = std::find_if(ers.begin(), ers.end()
          , [&winning_vote_count](auto const x) {
          return x.votes == winning_vote_count;
          });
    winner_iter->name = "President " + winner_iter->name;
    return *winner_iter;
  }

}  // namespace election

