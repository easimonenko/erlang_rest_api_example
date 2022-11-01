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

- Testing (all suites):

``` shell
make tests
```

- Testing API users:

``` shell
make ct-users
```

## Internals

For building of project and manage of its dependencies is used
[erlang.mk](https://erlang.mk/).

For testing of REST API is used _Common Test_ and standard _httpc_ module.

## API description

### `GET /api/users`

Get list of users. Returns JSON array with users data. Users date includes:

- `id`: user identifier.
- `email`: user email.
- `name`: real user name.

### `GET /api/users?email=EMAIL`

Find user by email. Returns user data.

### `GET /api/users/ID`

Get user data by his identifier.

### `POST /api/users`

Register new user with data in JSON format:

- `email`: user email. Used for log in server.
- `name`: real user name.
- `password`: password used for log in server.

### `POST /api/users/ID/session`:

Log in user with his ID and password passed in request body.
The user is assigned a session ID.

### `DELETE /api/users/ID/session`:

Log out user with his ID. Need used session ID.
User session is being cleared.

### `PATCH /api/users/ID/password`:

Change password for user with ID. Need used session ID.

### `DELETE /api/users/ID`:

Remove user data with ID. Need user session ID.

(c) Evgeny Simonenko, 2022
