-module(anagram).

-export([find_anagrams/2]).


find_anagrams(S, CS) ->
	lists:filter((fun(C) -> is_anagram(S, C) end), CS).

-spec is_anagram(string(), string()) -> boolean().
is_anagram(X, Y) ->
  (string:to_lower(X) /= string:to_lower(Y))
	  and (normalize(X) == normalize(Y)).

-spec normalize(string()) -> list(char()). 
normalize(Word) ->
  lists:sort(string:to_lower(Word)).
