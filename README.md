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
