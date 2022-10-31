-module(root_SUITE).
-export([all/0, init_per_suite/1, end_per_suite/1]).
-export([root_handler/1]).

init_per_suite(Config) ->
    ok = inets:start(),
    {ok, _} = application:ensure_all_started(erlang_rest_api_example),
    Config.

end_per_suite(_Config) ->
    ok = application:stop(erlang_rest_api_example),
    ok = inets:stop().

all() ->
    [root_handler].

root_handler(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "text/html"}],
         _}} = httpc:request("http://localhost:8080").
