-module(space_age).

-export([age/2]).


conversion(earth) -> 1.0 / 31557600;
conversion(mercury) -> conversion(earth) / 0.2408467;
conversion(venus) -> conversion(earth) / 0.61519726;
conversion(mars) -> conversion(earth) / 1.8808158;
conversion(jupiter) -> conversion(earth) / 11.862615;
conversion(saturn) -> conversion(earth) / 29.447498;
conversion(uranus) -> conversion(earth) / 84.016846;
conversion(neptune) -> conversion(earth) / 164.79132.

age(P, S) ->
  conversion(P) * S.
