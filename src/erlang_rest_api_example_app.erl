-module(erlang_rest_api_example_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [{"/", root_handler, []}]}
                 ]),
    {ok, _} = cowboy:start_clear(listener,
                                [{port, 8080}],
                                #{env => #{dispatch => Dispatch}}
                                ),
    erlang_rest_api_example_sup:start_link().

stop(_State) ->
	ok.
