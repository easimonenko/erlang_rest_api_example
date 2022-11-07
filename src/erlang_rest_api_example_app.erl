-module(erlang_rest_api_example_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile(
                 [{'_', [
                         {"/", root_handler, []},
                         {"/api/users/[:id]", api_users_handler, []},
                         {"/api/users/:id/session", api_users_session_handler, []},
                         {"/api/users/:id/password", api_users_password_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(rest_api_listener,
                                [{port, 8080}],
                                #{env => #{dispatch => Dispatch}}
                                ),
    erlang_rest_api_example_sup:start_link().

stop(_State) ->
	ok.
