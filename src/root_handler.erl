-module(root_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
    OurReq = cowboy_req:reply(200,
                          #{<<"Content-Type">> => <<"text/html">>},
                          <<"<h1>Root Page</h1>">>,
                          Req),
    {ok, OurReq, State}.
