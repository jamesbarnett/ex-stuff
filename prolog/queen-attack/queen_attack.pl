:- use_module(library(clpfd)).

create((Row, Col)) :- [Row, Col] ins 0..7.

attack((Row1, _), (Row2, _)) :- Row1 #= Row2, !.
attack((_, Col1), (_, Col2)) :- Col1 #= Col2, !.
attack((Row1, Col1), (Row2, Col2)) :- abs(Row1 - Row2) #= abs(Col1 - Col2).
