-module(root_SUITE).
-export([all/0, init_per_suite/1, end_per_suite/1]).
-export([root_handler/1]).

init_per_suite(Config) ->
    inets:start(), Config.

end_per_suite(_Config) ->
    inets:stop().

all() ->
    [root_handler].

root_handler(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "text/html"}],
         _}} = httpc:request("http://localhost:8080").
