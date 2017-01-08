-module(fizzbuzz_SUITE).

-compile(export_all).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

all() ->
  [
    numbers_from_1_to_2,
    numbers_from_1_to_3,
    numbers_from_1_to_5,
    numbers_from_1_to_20
  ].

init_per_suite(Config) ->
  ok = application:start(fizzbuzz),
  Config.

end_per_suite(Config) ->
  ok = application:stop(fizzbuzz),
  Config.

numbers_from_1_to_2(_Config) ->
  Result = fizzbuzz_app:fizzbuzz(lists:seq(1, 2)),
  ?assertEqual([1, 2], Result).

numbers_from_1_to_3(_Config) ->
  Result = fizzbuzz_app:fizzbuzz(lists:seq(1, 3)),
  ?assertEqual([1, 2, "Fizz"], Result).

numbers_from_1_to_5(_Config) ->
  Result = fizzbuzz_app:fizzbuzz(lists:seq(1, 5)),
  ?assertEqual([1, 2, "Fizz", 4, "Buzz"], Result).

numbers_from_1_to_20(_Config) ->
  Result = fizzbuzz_app:fizzbuzz(lists:seq(1, 20)),
  ?assertEqual([1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"], Result).
