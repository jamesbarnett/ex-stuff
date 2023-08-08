module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0.0
      3.213
    elsif balance  < 1000.0 and balance >= 0.0
      0.5
    elsif balance < 5000.0
      1.621
    elsif balance >= 5000.0
      2.475
    end
  end

  def self.annual_balance_update(balance)
    interest_rate(balance) * balance * 0.01 + balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    difference = desired_balance - current_balance
    future_balance = current_balance
    
    count = 0

    until future_balance >= desired_balance do
      count += 1

      future_balance = annual_balance_update(future_balance)
    end

    count
  end
end
