-module(protein_translation).

-export([proteins/1]).


chunk([]) -> [];
% chunk([C1,C2,C3|[]]) -> [C1,C2,C3];
chunk([C1,C2,C3|Rest]) ->
  IsStopToken = lists:member(string:join([C1,C2,C3], ""), ["UAA", "UAG", "UGA"]),
  if IsStopToken ->
       [];
  true ->
      string:join([C1,C2,C3], "") ++ chunk(Rest)
  end.

decode("AUG") -> methionine;
decode("UUU") -> phenylalanine;
decode("UUC") -> phenylalanine;
decode("UUA") -> leucine;
decode("UUG") -> leucine;
decode("UCU") -> serine;
decode("UCC") -> serine;
decode("UCA") -> serine;
decode("UCG") -> serine;
decode("UAU") -> tyrosine;
decode("UAC") -> tyrosine;
decode("UGU") -> cysteine;
decode("UGC") -> cysteine;
decode("UGG") -> tryptophan;
decode("UAA") -> stop;
decode("UAG") -> stop;
decode("UGA") -> stop;
decode("") -> erlang:error(badarg);
decode(Strand) when length(Strand) > 3 ->
    lists:foreach(fun (X) -> io:format("chunk: ~p~n", X) end, chunk(Strand)),
    lists:flatten(lists:map(fun (X) -> decode(X) end, chunk(Strand))).

proteins([]) -> {ok, []};
proteins("UAA") -> {ok, []};
proteins("UAG") -> {ok, []};
proteins("UGA") -> {ok, []};
proteins(Strand) when length(Strand) == 3 ->
 	{ok, [decode(Strand)] };
proteins(Strand) ->
  Lst = lists:filter(fun (X) -> X =/= stop end, decode(Strand)),
	Proteins = lists:flatten(Lst),
	{ok, Proteins }.
