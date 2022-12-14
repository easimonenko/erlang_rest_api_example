-module(users_SUITE).

-export([all/0, init_per_suite/1, end_per_suite/1]).
-export([users_get/1, users_get_by_email/1, users_get_by_id/1, users_post/1, users_delete/1]).
-export([users_get_session_by_id/1, users_post_session/1, users_delete_session/1]).
-export([users_patch_password/1]).

init_per_suite(Config) ->
    ok = inets:start(),
    {ok, _} = application:ensure_all_started(erlang_rest_api_example),
    Config.

end_per_suite(_Config) ->
    application:stop(erlang_rest_api_example),
    inets:stop().

all() ->
    [users_get, users_get_by_email, users_get_by_id, users_post, users_delete,
    users_post_session, users_delete_session,
    users_patch_password].

users_get(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request("http://localhost:8080/api/users").

users_get_by_email(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(
                 io_lib:format("http://localhost:8080/api/users/?email=~s",
                               ["user1@example.com"])).

users_get_by_id(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(
                 io_lib:format("http://localhost:8080/api/users/~i", [1])).

users_post(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(post, {
                                    "http://localhost:8080/api/users",
                                    [],
                                    "application/x-www-form-urlencoded",
                                    ""},
                             [], []).

users_delete(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(delete, {
                                    io_lib:format("http://localhost:8080/api/users/~i", [1]),
                                    []},
                             [], []).

users_get_session_by_id(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(
                 io_lib:format("http://localhost:8080/api/users/~i/session", [1])).

users_post_session(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(post, {
                                    io_lib:format("http://localhost:8080/api/users/~i/session", [1]),
                                    [],
                                    "application/x-www-form-urlencoded",
                                    ""},
                             [], []).

users_delete_session(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(delete, {
                                    io_lib:format("http://localhost:8080/api/users/~i/session", [1]),
                                    []},
                             [], []).

users_patch_password(_Config) ->
    {ok, {{"HTTP/1.1", 200, "OK"},
         [_, _, _, {"content-type", "application/json"}],
         _}} = httpc:request(patch, {
                                    io_lib:format("http://localhost:8080/api/users/~i/password", [1]),
                                    [],
                                    "application/x-www-form-urlencoded",
                                    ""},
                             [], []).
