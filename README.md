# CS2030 Bus API

All results are in plain text, separated by commas.

If an invalid `bus stop number` or `bus service number` is supplied, the page responds `404 Not Found` with a 404 HTTP status.

---

### `/bus_services/<bus service number>`
e.g. https://cs2030-bus-api.herokuapp.com/bus_services/95

Bus stops served by a particular bus service

---

### `/bus_stops/<bus stop number>`
e.g. https://cs2030-bus-api.herokuapp.com/bus_stops/18331

Bus services that serve a particular bus stop

---

### `/bus_stops/<bus stop number>/nearby`
e.g. https://cs2030-bus-api.herokuapp.com/bus_stops/18331/nearby

Bus stops that are within a 5-minute walking distance (~400m) of a particular bus stop

---

# Setup

_This guide assumes that you are developing on macOS._

1. Install Ruby 2.4.1 (Recommended: [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/))

1. Install PostgreSQL (Recommended: [Postgres.app](https://postgresapp.com/) or via Homebrew)

1. Clone the repo and `cd` into it

1. Run `gem install bundler`, followed by `bundle` to install all dependencies

1. Run `rails db:setup` to create the database and populate the seed data

1. Start the server with `rails s` and visit `localhost:3000` to test that it works on your local machine
