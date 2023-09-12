-module(hamming).

-export([distance/2]).


distance(S1, S2) when length(S1) =/= length(S2) ->
  {error,badarg};
distance(Strand1, Strand2) ->
  lists:sum(
    lists:zipwith(
      fun(S1, S2) ->
          case (S1 =:= S2) of
            true -> 0;
            false -> 1
          end
      end,
      Strand1,
      Strand2)).
