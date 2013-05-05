-module(my_home).
-export([init/3, handle/2, terminate/2]).

init(_, Req, []) ->
	{ok, Req, undefined_state}.

handle(Req, State) ->
	{ok, Data} = file:read_file("priv/main_page.html"),
	{ok, Req2} = cowboy_http_req:reply(200,
		[{'Content-Type', <<"text/html">>}],
		Data, Req),
	{ok, Req2, State}.

terminate(_, _) ->
	ok.
