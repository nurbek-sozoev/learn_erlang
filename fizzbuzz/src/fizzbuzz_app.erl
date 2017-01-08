%%%-------------------------------------------------------------------
%% @doc fizzbuzz public API
%% @end
%%%-------------------------------------------------------------------

-module(fizzbuzz_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, fizzbuzz/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    fizzbuzz_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%--------------------------------------------------------------------

fizzbuzz([H|T]) -> [make_fizzbuzz(H)] ++ fizzbuzz(T);
fizzbuzz([]) -> [].

%%====================================================================
%% Internal functions
%%====================================================================

make_fizzbuzz(Number) ->
    Fizz = fizz(Number), Buzz = buzz(Number),
    if
        Fizz =:= Buzz -> Number;
        true          -> Fizz ++ Buzz
    end.

fizz(Number) ->
    if
        Number rem 3 =:= 0 -> "Fizz";
        true               -> ""
    end.

buzz(Number) ->
    if
        Number rem 5 =:= 0 -> "Buzz";
        true               -> ""
    end.
