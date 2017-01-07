-module(area_server).
-export([start/0, area/2]).

start() ->
	spawn(fun loop/0).

area(Pid, Params) ->
	rpc(Pid, Params).

rpc(Pid, Request) ->
	Pid ! {self(), Request},
	receive
		{Pid, Response} ->
			Response
	end.

loop() ->
	receive
		{From, {rectangle, Width, Height}} ->
			From ! {self(), Width*Height},
			loop();
		{From, {circle, Raduis}} ->
			From ! {self(), 3.14159*Raduis*Raduis},
			loop();
		{From, Other} ->
			From ! {self(), {error, Other}},
			loop()
	end.
