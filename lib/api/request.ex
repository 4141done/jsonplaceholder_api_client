defmodule JsonPlaceholder.API.Request do
  @moduledoc """
  A module representing a generic http request providing methods for working with
  the request. This module is designed to normalize the API request format
  across different client implementations
  """
  defstruct host: nil, path: nil, body: nil, query: %{}, headers: []

  alias Jason, as: JsonLib

  def build(host, path, body \\ %{}, query \\ %{}, headers \\ []) do
    %__MODULE__{
      host: host,
      path: path,
      body: body,
      query: query,
      headers: headers
    }
    |> add_normalized_path()
    |> maybe_add_query_string()
    |> maybe_json_encode_body()
  end

  def uri_with_host(%{host: host, path: path}), do: "#{host}/#{path}"

  defp maybe_json_encode_body(%__MODULE__{body: nil} = request), do: request

  defp maybe_json_encode_body(%__MODULE__{body: body} = request) do
    %__MODULE__{request | body: JsonLib.encode!(body)}
  end

  defp maybe_add_query_string(%__MODULE__{query: %{}} = request), do: request

  defp maybe_add_query_string(%__MODULE__{path: path, query: query} = request) do
    %__MODULE__{request | path: "#{path}?#{URI.encode_query(query)}"}
  end

  defp add_normalized_path(%__MODULE__{path: "/" <> path} = request) do
    %__MODULE__{request | path: path}
  end

  defp add_normalized_path(%__MODULE__{} = request), do: request
end
