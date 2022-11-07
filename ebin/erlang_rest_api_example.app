{application, 'erlang_rest_api_example', [
	{description, "REST API example in Erlang with Cowboy web server."},
	{vsn, "0.1.0"},
	{modules, ['api_users_handler','api_users_password_handler','api_users_session_handler','erlang_rest_api_example_app','erlang_rest_api_example_sup','root_handler']},
	{registered, [erlang_rest_api_example_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {erlang_rest_api_example_app, []}},
	{env, []}
]}.