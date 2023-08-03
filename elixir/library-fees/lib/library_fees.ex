defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, ndt} = NaiveDateTime.from_iso8601(string)
    ndt
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days_checked_out = if before_noon?(checkout_datetime) do
      28
    else
      29
    end

    checkout_datetime
    |> NaiveDateTime.to_date
    |> Date.add(days_checked_out)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    day_of_week = datetime
    |> NaiveDateTime.to_date
    |> Date.day_of_week

    1 == day_of_week
  end

  def calculate_late_fee(checkout, return, rate) do 
    d_out = datetime_from_string(checkout)
    d_in = datetime_from_string(return)

    datetime_in_expected = return_date(d_out)
    |> Date.to_string
    |> Kernel.then(fn d -> d <> " 00:00:00" end)
    |> NaiveDateTime.from_iso8601!

    days = days_late(datetime_in_expected, d_in)
    fee = if monday?(d_in) do
      days * rate * 0.5
    else
      days * rate
    end
    floor(fee)
  end
end
