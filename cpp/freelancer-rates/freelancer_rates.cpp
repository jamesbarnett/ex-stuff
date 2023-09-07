#include <cmath>


const int DAILY_MULTIPLIER = 8;
const int BILLABLE_DAYS_PER_MONTH = 22;

[[nodiscard]]
constexpr double daily_rate(double hourly_rate) {
    return hourly_rate * DAILY_MULTIPLIER;
}

[[nodiscard]]
constexpr double apply_discount(double before_discount, double discount) {
    return before_discount * (100.0 - discount) / 100.0;
}

[[nodiscard]]
constexpr int monthly_rate(double hourly_rate, double discount) {
    return std::ceil(apply_discount(
            BILLABLE_DAYS_PER_MONTH * DAILY_MULTIPLIER * hourly_rate
            , discount));
}

[[nodiscard]]
constexpr int days_in_budget(int budget, double hourly_rate, double discount) {
    auto discounted_daily_rate = apply_discount(hourly_rate * DAILY_MULTIPLIER
            , discount);
    return budget / discounted_daily_rate;
}
