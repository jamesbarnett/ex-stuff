%% Generated with 'testgen v0.2.0'
%% Revision 1 of the exercises generator was used
%% https://github.com/exercism/problem-specifications/raw/42dd0cea20498fd544b152c4e2c0a419bb7e266a/exercises/space-age/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(space_age_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").


-define(equalFloat(Desc, A, B), {Desc, ?_assertEqual(B, round(A,2))}).

round(Number, Precision) ->
    P = math:pow(10, Precision),
    round(Number * P) / P.


'1_age_on_earth_test_'() ->
    ?equalFloat("age on Earth",
		space_age:age(earth, 1000000000), 3.169e+1).

'2_age_on_mercury_test_'() ->
    ?equalFloat("age on Mercury",
		space_age:age(mercury, 2134835688),
		2.80879999999999995453e+2).
%
'3_age_on_venus_test_'() ->
    ?equalFloat("age on Venus",
		space_age:age(venus, 189839836),
		9.77999999999999936051).
%
'4_age_on_mars_test_'() ->
    ?equalFloat("age on Mars",
		space_age:age(mars, 2129871239), 3.588e+1).
%
'5_age_on_jupiter_test_'() ->
    ?equalFloat("age on Jupiter",
		space_age:age(jupiter, 901876382), 2.41).
%
'6_age_on_saturn_test_'() ->
    ?equalFloat("age on Saturn",
		space_age:age(saturn, 2000000000),
		2.14999999999999991118).
%
'7_age_on_uranus_test_'() ->
    ?equalFloat("age on Uranus",
		space_age:age(uranus, 1210123456), 4.6e-1).
%
'8_age_on_neptune_test_'() ->
    ?equalFloat("age on Neptune",
		space_age:age(neptune, 1821023456),
		3.49999999999999977796e-1).
