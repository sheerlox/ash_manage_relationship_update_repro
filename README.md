# AshManageRelationshipUpdateRepro

## Running the tests

Needs a running PostgreSQL DB, see [`config/test.exs`](./config/test.exs).

```
mix do deps.get, deps.compile
MIX_ENV=test mix do ash_postgres.create, ash_postgres.migrate
mix test
```

## Files

### Resources

- [`profile.ex` (main)](./lib/profiles/profile.ex)
- [`user.ex` (managed)](./lib/accounts/user.ex)

### Test

- [`ash_repro_test.exs`](./test/ash_repro_test.exs)
