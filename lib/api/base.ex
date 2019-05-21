defmodule JsonPlaceholder.API.Base do
  @moduledoc """
  Base is should provide methods to handle the HTTP verbs.  In the future this is where
  we should eventually configure the HTTP library but for now it's set to use HTTPoison
  """

  # Don't use HTTPoison Base here because eventually we'll want to swap in our own modules.
  # For a normal production implementation I'd just choose Httpoison at this point.
  # However the goal here is to try out some ideas
  alias JsonPlaceholder.API.Response

  require Logger
  alias HTTPoison, as: HTTPClient

  @base_url "https://jsonplaceholder.typicode.com"

  @doc """
    Performs a GET http request to the specified `path` with the optionally specified
    `params` and `headers`

    Returns a `JsonPlaceholder.API.Response` struct


    ## Examples

        iex> JsonPlaceholder.API.get("/posts")
        %JsonPlaceholder.API.Response{}
  """
  def get(path, params \\ %{}, headers \\ []) do
    path
    |> build_uri()
    |> maybe_add_query_string(params)
    |> HTTPClient.get(headers)
    |> handle_response()
  end

  def post(path, params \\ %{}, headers \\ []) do
    path
    |> build_uri()
    |> HTTPClient.post(params, headers)
    |> handle_response()
  end

  def put(path, params \\ %{}, headers \\ []) do
    path
    |> build_uri()
    |> HTTPClient.put(params, headers)
    |> handle_response()
  end

  # TODO: If we really want to abstract out our http client, we'll need to wrap it in
  # an implementation of a behaviour to ensure that the args passed to a method like
  # handle_response/1 are all the same
  @spec handle_response({:ok | :error, map()}) :: {:ok | :error, map(), integer()}
  defp handle_response({:ok, %{body: body, status_code: status_code}}) do
    response =
      %Response{raw_body: body, status_code: status_code}
      |> Response.decode_json()
      |> Response.assign_error()

    {:ok, response}
  end

  defp handle_response({:error, %{body: body, status_code: status_code}}) do
    error_response =
      %Response{raw_body: body, status_code: status_code}
      |> Response.decode_json()
      |> Response.assign_error()

    {:error, error_response}
  end

  defp normalize_path("/" <> path), do: path
  defp normalize_path(path), do: path

  defp build_uri(path) do
    "#{@base_url}/#{normalize_path(path)}"
  end

  defp maybe_add_query_string(string_uri, %{}), do: string_uri

  defp maybe_add_query_string(string_uri, params) do
    "#{string_uri}?#{URI.encode_query(params)}"
  end
end
