# PhoenixLoggedApp

This is a simple Elixir/Phoenix application that demonstrates how to use the
[ExKafkaLogger](https://github.com/jeffhsta/exkafkalogger).

## Instructions

To start a Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

After using this, you can for example send a POST request to
[`localhost:4000/message`](http://localhost:4000/message) with a JSON that follows
this example: (with Postman i.e)

```
{
  "message": "content"
}
```

This message will be logged by Kafka (if you have a instance configured) as well
as any error messages or connection messages (from requests/responses).

One other possible case is when you ask for a route that doesn't exist, like for
example: [`localhost:4000/a`](http://localhost:4000/a). When this happens the error
will automatically be logged in Kafka using ExKafkaLogger (because the route does
not exist).

The other possible case is when you ask for the right route (`localhost:4000/message`)
but does not pass the `message:` key in the JSON. This will lead to a exception
in the application. This exception will also be logged by ExKafkaLogger.
