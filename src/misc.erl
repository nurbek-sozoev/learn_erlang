-module(misc).
-export([
    sum/1, 
    for/3, 
    map/2, 
    qsort/1, 
    pythagor/1,
    perms/1,
    odds_and_evens/1
]).
-include("records.hrl").

sum(L)        -> sum(L, 0).

sum([], N)    -> N;
sum([H|T], N) -> sum(T, H+N).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I)|for(I+1, Max, F)].

map(_, [])    -> [];
map(F, [H|T]) -> [ F(H) | map(F, T) ].

qsort([]) -> [];
qsort([Pivot|T]) -> 
qsort([X || X <- T, X < Pivot]) 
++ [Pivot] ++
qsort([X || X <- T, X >= Pivot]).

pythagor(N) -> [
    {A,B,C} || 
    A <- lists:seq(1,N),
    B <- lists:seq(1,N),
    C <- lists:seq(1,N),
    A + B + C =< N,
    A * A + B * B =:= C * C
].

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

odds_and_evens(L) -> odds_and_evens(L, [], []).
odds_and_evens([H|T], Odds, Evens) -> 
case (H rem 2) of
    1 -> odds_and_evens(T, [H|Odds], Evens);
    0 -> odds_and_evens(T, Odds, [H|Evens])
end;
odds_and_evens([], Odds, Evens) -> {lists:reverse(Odds), lists:reverse(Evens)}.