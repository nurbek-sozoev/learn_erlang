-module(shop_t).
-export([total/1]).

-import(misc, [sum/1, map/2]).
-import(shop, [cost/1]).

total(L) -> sum( map( fun({Product, N}) -> shop:cost(Product) * N end, L ) ).
