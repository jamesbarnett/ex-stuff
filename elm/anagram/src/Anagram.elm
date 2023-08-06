module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    candidates
        |> List.filter (\x -> anagram (String.toUpper x) (String.toUpper word))


normalize : String -> List Char
normalize =
    String.toLower >> String.toList >> List.sort


anagram : String -> String -> Bool
anagram x y =
    x /= y && normalize x == normalize y
