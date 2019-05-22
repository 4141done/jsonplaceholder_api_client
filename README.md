# JsonPlaceholder

This is a simple project to experiment with ideas behind writing http client libraries in Elixir.
It uses the [Json Placeholder](https://jsonplaceholder.typicode.com/) API as an example.

Currently it uses Httpoison for its pool of persistant connections to a single host, and Jason
for fast JSON parsing.

It's designed to mimic a consumer-facing API client of a public API.

I'm also playing with the idea of allowing different HTTP library implementations so
eventually you'd be able to write, say, a Mint-based modules that you could configure
the library to use in order to avoid taking on an Httpoison dependency.


## TODOs
- [] Add tests
- [] handle `HEAD` type responses
- [] Settle on basic module api that supports all features of the Json Placeholder API
- [] Write and generate documentation
- [] Provide http headers in response object
- [] Allow one-time configuration of headers
- [] Support adding a "target term" to decode json into
- [] Abstract http client away
- [] Allow turning on CURL debug output
- [] Play creating a generic API client with target terms like so `Client.index(%ClientConfig{host: "foo", endpoint_map: %{}}, :posts, params, target_term)`
- [] Try create an internal client-like library (circuit breaking, configurable retries, configurable timeouts)