## Purpose

This simple Sinatra strives to provide one feature: exchange rates for
pairs of currency codes.  However, it is plagued by a flaky service
provider as its source for its exchange rates.

A sample of the expected request/response (extraneous headers have been trimmed):

```
GET /rate/USD/EUR

HTTP/1.1 200 OK
Content-Length: 34
Content-Type: application/json

{"from":"USD","to":"EUR","rate":0.73}
```

## Challenge

Implement all the test stubs and the required functionality to make
those tests pass.

To run the tests, simply use: `rake`

To run the app itself, run: `ruby app.rb`
