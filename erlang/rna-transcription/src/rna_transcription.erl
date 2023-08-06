-module(rna_transcription).

-export([to_rna/1]).

-spec to_rna(string()) -> string().
to_rna([]) -> [];
to_rna([H|T]) -> [to_dna_char(H) | to_rna(T)].

-spec to_dna_char(string()) -> string().
to_dna_char($G) -> $C;
to_dna_char($C) -> $G;
to_dna_char($T) -> $A;
to_dna_char($A) -> $U;
to_dna_char(_) -> throw(error).
