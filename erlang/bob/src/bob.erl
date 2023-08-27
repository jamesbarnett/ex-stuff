-module(bob).

-export([response/1]).

response(Str) ->
  NS = string:trim(Str, trailing),
  case NS of
    [] -> "Fine. Be that way!";
    _ -> response(yelling(NS), question(NS))
  end.

question(Str) ->
  lists:suffix("?", Str).

yelling(Str) ->
  string:uppercase(Str) =:= Str andalso
  not (string:lowercase(Str) =:= Str).

response(true, true) -> "Calm down, I know what I'm doing!";
response(true, _)    -> "Whoa, chill out!";
response(_, true)    -> "Sure.";
response(_,_)        -> "Whatever.".

