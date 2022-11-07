-module(api_users_session_handler).
-behaviour(cowboy_rest).

-export([init/2, terminate/3]).
-export([allowed_methods/2, content_types_provided/2, to_json/2]).
-export([handle/2]).

allowed_methods(Req, State) ->
    {[<<"GET">>, <<"POST">>, <<"DELETE">>], Req, State}.

init(Req, State) ->
    {cowboy_rest, Req, State}.

content_types_provided(Req, State) ->
    {[{{<<"application">>, <<"json">>, '*'},to_json}], Req, State}.

to_json(Req, State) ->
    {<<"[]">>, Req, State}.

handle(Req, State) ->
    {Method, _} = cowboy_req:method(Req),
    case Method of
        <<"GET">> ->
            {ok, Reply} = cowboy_http_req:reply(200, [], [], Req),
            {ok, Reply, State};
        <<"POST">> ->
            {ok, Reply} = cowboy_http_req:reply(200, [], [], Req),
            {ok, Reply, State};
        <<"DELETE">> ->
            {ok, Reply} = cowboy_http_req:reply(200, [], [], Req),
            {ok, Reply, State}
    end.

terminate(_Reason, _Req, _State) ->
    ok.
