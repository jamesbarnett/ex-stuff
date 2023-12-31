defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when secret_number == guess - 1 or secret_number == guess + 1, do: "So close"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
  def compare(secret_number, guess) when guess != :no_guess and secret_number < guess, do: "Too high"
  def compare(_secret_number, guess) when guess == :no_guess, do: "Make a guess"
end
