require Logger
defmodule Username do
  defp char_allowed?(char) when char >= ?a and char <= ?z, do: true
  defp char_allowed?(?_), do: true
  defp char_allowed?(_), do: false

  def replace_char(char) do
    case char do
      ?ä -> "ae"
      ?ö -> "oe"
      ?ü -> "ue"
      ?ß -> "ss"
      _ -> [char]
    end
  end

  def sanitize(username) do
    username
    |> Enum.flat_map(&replace_char/1)
    |> Enum.filter(&char_allowed?/1)
  end
end



#defmodule Username do
#   def sanitize(username) do
#     username = to_string(username)
#     replacements = [
#       ["ä", "ae"],
#       ["ö", "oe"],
#       ["ü", "ue"],
#       ["ß", "ss"]
#     ]
#
#     username = Enum.reduce(replacements, username,
#       fn(re, str) ->
#         String.replace(str, Enum.at(re, 0), Enum.at(re, 1))
#       end)
#     username = Regex.scan(~r/[[:lower:]]+(?:_+[a-z]+)*/u, username)
#     username
#     |> (fn str -> "#{str}" end).()
#     |> to_charlist()
#   end
# end
