#include <algorithm>
#include <array>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

[[nodiscard]] std::vector<int>
round_down_scores(std::vector<double> student_scores) {
  std::vector<int> rounded{};

  std::transform(student_scores.cbegin(), student_scores.cend(),
                 std::back_inserter(rounded),
                 [](auto const x) { return static_cast<int>(x); });
  return rounded;
}

[[nodiscard]] int count_failed_students(std::vector<int> student_scores) {
  return std::count_if(student_scores.cbegin(), student_scores.cend(),
                       [](auto const x) { return 40 >= x; });
}

[[nodiscard]] std::vector<int> above_threshold(std::vector<int> student_scores,
                                               int threshold) {
  std::vector<int> best;
  std::copy_if(student_scores.cbegin(), student_scores.cend(),
               std::back_inserter(best),
               [&threshold](auto const x) { return threshold <= x; });
  return best;
}

[[nodiscard]] std::array<int, 4> letter_grades(int highest_score) {
  const int low = 40;
  const int difference = highest_score - low;
  const int count = difference / 4;

  std::array<int, 4> results{};
  std::iota(results.begin(), results.end(), 0);
  std::transform(results.begin(), results.end(), results.begin(),
                 [&count, &low](auto const n) { return n * count + low + 1; });
  return results;
}

[[nodiscard]] std::vector<std::string>
student_ranking(std::vector<int> student_scores,
                std::vector<std::string> student_names) {
  auto scores_iter = student_scores.begin();
  auto names_iter = student_names.begin();
  std::vector<std::pair<std::string, int>> scores_by_student;

  while (scores_iter != student_scores.cend()) {
    scores_by_student.push_back(
        std::make_pair(std::ref(*names_iter), *scores_iter));
    ++names_iter;
    ++scores_iter;
  }

  std::sort(
      scores_by_student.begin(), scores_by_student.end(),
      [](const std::pair<std::string, int> &x,
         const std::pair<std::string, int> &y) { return x.second > y.second; });

  auto rank = 0;
  std::transform(scores_by_student.cbegin(), scores_by_student.cend(),
                 student_names.begin(), [&rank](const auto e) {
                   return std::to_string(++rank) + ". " + e.first + ": " +
                          std::to_string(e.second);
                 });
  return student_names;
}

[[nodiscard]] std::string
perfect_score(std::vector<int> student_scores,
              std::vector<std::string> student_names) {
  auto scores_iter = student_scores.begin();
  auto names_iter = student_names.begin();

  while (scores_iter != student_scores.end()) {
    if (100 == *scores_iter)
      return *names_iter;
    ++scores_iter;
    ++names_iter;
  }

  return "";
}
