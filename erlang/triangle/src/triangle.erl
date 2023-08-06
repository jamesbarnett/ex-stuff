-module(triangle).

-export([kind/3]).

% -spec kind(float(), float(), float()) 
	% -> equilateral | isosceles | scalene | {error, String}
kind(A, B, C) when A + B < C; A + C < B; B + C < A ->
	{error, "side lengths violate triangle inequality"};

kind(A, B, C) when A =< 0; B =< 0; C =< 0 ->
	{error, "all side lengths must be positive"};

kind(X, X, X) -> equilateral;
kind(X, X, _) -> isosceles;
kind(_, X, X) -> isosceles;
kind(X, _, X) -> isosceles;
kind(_, _, _) -> scalene.

