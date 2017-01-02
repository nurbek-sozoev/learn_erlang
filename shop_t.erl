-module(shop_t).
-export([total/1]).
total([{Product, N}|T]) -> shop:cost(Product) * N + total(T);
total([])               -> 0.