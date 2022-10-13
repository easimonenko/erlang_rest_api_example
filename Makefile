PROJECT = erlang_rest_api_example
PROJECT_DESCRIPTION = REST API example in Erlang with Cowboy web server.
PROJECT_VERSION = 0.1.0

DEPS = cowboy
dep_cowboy_commit = 2.9.0

DEP_PLUGINS = cowboy

BUILD_DEPS += relx

include erlang.mk
