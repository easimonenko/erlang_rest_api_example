# erlang\_rest\_api\_example

REST API example in Erlang with Cowboy web server.

- Building:

``` shell
make
```

- Running:

``` shell
make run
```

- Browsing:

Open in browser URL <http://localhost:8080>.

## Internals

For building of project and manage of its dependencies is used
[erlang.mk](https://erlang.mk/).

## API description

### `GET /users`

Get list of users. Returns JSON array with users data. Users date includes:

- `id`: user identifier.
- `email`: user email.
- `name`: real user name.

### `GET /users?email=EMAIL`

Find user by email. Returns user data.

### `GET /users/ID`

Get user data by his identifier.

### `POST /users`

Register new user with data in JSON format:

- `email`: user email. Used for log in server.
- `name`: real user name.
- `password`: password used for log in server.

### `POST /users/ID/login`:

Log in user with his ID and password passed in request body.
The user is assigned a session ID.

### `POST /users/ID/logout`:

Log out user with his ID.
Also used session ID and session is being cleared.

### `PATCH /users/ID/password`:

Change password for user with ID.
Also used session ID.

(c) Evgeny Simonenko, 2022
