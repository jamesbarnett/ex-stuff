defmodule TakeANumber do
  def start() do
    last_number = 0
    spawn(fn -> loop(last_number) end)
  end

  defp loop(last_number) do
    receive do
      {:report_state, sender_pid } ->
        send(sender_pid, last_number)
        loop(last_number)
      {:take_a_number, sender_pid } ->
        send(sender_pid, last_number + 1)
        loop(last_number + 1)
      :stop ->
        Process.exit(self(), :kill)
      _ ->
        loop(last_number)
    end
  end
end

