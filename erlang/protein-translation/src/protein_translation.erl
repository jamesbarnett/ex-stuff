-module(protein_translation).

-export([proteins/1]).

chunk_n([], _) ->
    [];
chunk_n(List, Len) when Len > length(List) ->
    [List];
chunk_n(List, Len) ->
    {Head, Tail} = lists:split(Len, List),
    [Head | chunk_n(Tail, Len)].

decode("AUG") ->
    methionine;
decode("UUU") ->
    phenylalanine;
decode("UUC") ->
    phenylalanine;
decode("UUA") ->
    leucine;
decode("UUG") ->
    leucine;
decode("UCU") ->
    serine;
decode("UCC") ->
    serine;
decode("UCA") ->
    serine;
decode("UCG") ->
    serine;
decode("UAU") ->
    tyrosine;
decode("UAC") ->
    tyrosine;
decode("UGU") ->
    cysteine;
decode("UGC") ->
    cysteine;
decode("UGG") ->
    tryptophan;
decode("UAA") ->
    stop;
decode("UAG") ->
    stop;
decode("UGA") ->
    stop;
decode([_, _, _]) ->
    nil;
decode([_, _]) ->
    nil;
decode([_]) ->
    nil;
decode([]) ->
    nil.

proteins([]) ->
    {ok, []};
proteins("UAA") ->
    {ok, []};
proteins("UAG") ->
    {ok, []};
proteins("UGA") ->
    {ok, []};
proteins(Strand) when length(Strand) == 3 ->
    case decode(Strand) of
        Xs when is_atom(Xs) andalso Xs =/= stop andalso Xs =/= nil -> {ok, [Xs]};
        nil -> {error, badarg}
    end;
proteins(Strand) ->
    Chunks = chunk_n(Strand, 3),
    Proteins = lists:takewhile(
        fun(X) -> X =/= stop end, lists:map(fun(X) -> decode(X) end, Chunks)
    ),
    case lists:member(nil, Proteins) of
        true -> {error, badarg};
        false -> {ok, Proteins}
    end.
