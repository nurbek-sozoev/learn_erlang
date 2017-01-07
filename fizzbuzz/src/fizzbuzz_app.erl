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

%%====================================================================
%% Internal functions
%%====================================================================

fizzbuzz(Numbers)         -> fizzbuzz(Numbers, []).
fizzbuzz([H|T], Result)   ->
if
    (H rem 3 =:= 0) and (H rem 5 =:= 0) -> fizzbuzz(T, ["FizzBuzz"] ++ Result);
    H rem 3 =:= 0                       -> fizzbuzz(T, ["Fizz"] ++ Result);
    H rem 5 =:= 0                       -> fizzbuzz(T, ["Buzz"] ++ Result);
    true                                -> fizzbuzz(T, [H] ++ Result)
end;
fizzbuzz([], Result)     -> lists:reverse(Result).
