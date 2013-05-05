-module(my_ws).
-export([init/3]).
-export([websocket_init/3]).
-export([websocket_handle/3]).
-export([websocket_info/3]).
-export([websocket_terminate/3]).

init(_, _, []) ->
	{upgrade, protocol, cowboy_http_websocket}.

websocket_init(_, Req, _) ->
	gproc:reg({p, l, main_room}),
	{ok, Req, undefined_state}.

websocket_handle(Payload, Req, State) ->
	gproc:send({p, l, main_room}, Payload),
	io:format("~p~n", [Payload]),
	{ok, Req, State}.

websocket_info(Info, Req, State) ->
	io:format("~p~n", [Info]),
	{reply, Info, Req, State}.

websocket_terminate(_, Req, State) ->
	ok.
