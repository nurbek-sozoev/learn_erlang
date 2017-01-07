-module(common_SUITE).

-compile(export_all).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

all() ->
  [
    area_test
  ].

init_per_suite(Config) ->
  ok = application:start(fizzbuzz),
  Config.

init_per_testcase(_, Config) ->
  % действия, выполняемые перед запуском теста
  Config.

end_per_testcase(_, Config) ->
  % действия, выполняемые после завершения теста
  Config.

end_per_suite(Config) ->
  ok = application:stop(fizzbuzz),
  Config.

area_test(_Config) ->
  Params = {rectangle, 10, 10},
  Result = fizzbuzz_app:area(Params),
  ?assertEqual(100, Result).
