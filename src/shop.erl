-module(shop).
-export([cost/1]).

cost(oranges)   -> 8;
cost(newspaper) -> 1;
cost(apples)    -> 7;
cost(pears)     -> 5;
cost(milk)      -> 3.
