# JsonPlaceholder

This is a simple project to experiment with ideas behind writing http client libraries in Elixir.
It uses the [Json Placeholder](https://jsonplaceholder.typicode.com/) API as an example.

Currently it uses Httpoison for its pool of persistant connections to a single host, and Jason
for fast JSON parsing.

It's designed to mimic a consumer-facing API client of a public API.

I'm also playing with the idea of allowing different HTTP library implementations so
eventually you'd be able to write, say, a Mint-based modules that you could configure
the library to use in order to avoid taking on an Httpoison dependency.
