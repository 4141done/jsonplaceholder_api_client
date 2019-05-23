defmodule JsonPlaceholder.API.Base do
  @moduledoc """
  Base is should provide methods to handle the HTTP verbs.  In the future this is where
  we should eventually configure the HTTP library and permanent headers, etc
  """

  alias JsonPlaceholder.API.{Request, Response}
  alias JsonPlacement.API.HTTPoisonClient, as: HTTPClient

  require Logger

  @base_url "https://jsonplaceholder.typicode.com"

  @doc """
    Performs a GET http request to the specified `path` with the optionally specified
    `query` and `headers`

    Returns a status tuple containing a `JsonPlaceholder.API.Response` struct


    ## Examples

        iex> JsonPlaceholder.API.get("/posts/1")
        {:ok, %JsonPlaceholder.API.Response{}}
  """

  @spec get(String.t(), map(), keyword()) :: %Response{}
  def get(path, query \\ %{}, headers \\ []) do
    Request.build(@base_url, path, nil, query, headers)
    |> HTTPClient.get()
  end

  @doc """
    Performs a POST http request to the specified `path` with the optionally specified
    `body` and `headers`

    Returns a status tuple containing a `JsonPlaceholder.API.Response` struct


    ## Examples

        iex> JsonPlaceholder.API.post("/posts", %{foo: bar})
        {:ok, %JsonPlaceholder.API.Response{}}
  """

  @spec post(String.t(), map(), keyword()) :: %Response{}
  def post(path, body \\ %{}, headers \\ []) do
    Request.build(@base_url, path, body, nil, headers)
    |> HTTPClient.post()
  end

  @doc """
    Performs a PUT http request to the specified `path` with the optionally specified
    `body` and `headers`

    Returns a status tuple containing a `JsonPlaceholder.API.Response` struct


    ## Examples

        iex> JsonPlaceholder.API.put("/posts", %{foo: bar})
        {:ok, %JsonPlaceholder.API.Response{}}
  """
  @spec put(String.t(), map(), keyword()) :: %Response{}
  def put(path, body \\ %{}, headers \\ []) do
    Request.build(@base_url, path, body, nil, headers)
    |> HTTPClient.put()
  end

  @doc """
    Performs a DELETE http request to the specified `path` with the optionally specified
    `query` and `headers`

    Returns a status tuple containing a `JsonPlaceholder.API.Response` struct


    ## Examples

        iex> JsonPlaceholder.API.delete("/posts/1")
        {:ok, %JsonPlaceholder.API.Response{}}
  """

  @spec delete(String.t(), map(), keyword()) :: %Response{}
  def delete(path, query \\ %{}, headers \\ []) do
    Request.build(@base_url, path, nil, query, headers)
    |> HTTPClient.delete()
  end
end
