double interest_rate(double balance) {
    if (0.0 > balance) return 3.213;
    if (1000.0 > balance) return 0.5;
    if (1000.0 <= balance && 5000.0 > balance) return 1.621;
    else return 2.475;
}

double yearly_interest(double balance) {
    return balance * interest_rate(balance) / 100.0;
}

double annual_balance_update(double balance) {
    return balance + yearly_interest(balance);
}

int years_until_desired_balance(double balance, double target_balance) {
    auto projected_balance{balance};
    auto years{0};

    while (projected_balance < target_balance) {
        projected_balance = annual_balance_update(projected_balance);
        ++years;
    }

    return years;
}
