defmodule JsonPlacement.API.HTTPoisonClient do
  @moduledoc """
  A client for http operations using HTTPoison and conforming to the
  `JsonPlaceholder.API.ClientBehaviour` behaviour. For performing API calls
  use `JsonPlaceholder.API.Base` insted of this module directly
  """
  @behaviour JsonPlaceholder.API.ClientBehaviour

  alias JsonPlaceholder.API.{Request, Response}

  @impl true
  def get(%Request{headers: headers} = request) do
    request
    |> Request.uri_with_host()
    |> HTTPoison.get(headers)
    |> handle_response()
  end

  @impl true
  def post(%Request{body: body, headers: headers} = request) do
    request
    |> Request.uri_with_host()
    |> HTTPoison.post(body, headers)
    |> handle_response()
  end

  @impl true
  def put(%Request{body: body, headers: headers} = request) do
    request
    |> Request.uri_with_host()
    |> HTTPoison.put(body, headers)
    |> handle_response()
  end

  @impl true
  def delete(%Request{headers: headers} = request) do
    request
    |> Request.uri_with_host()
    |> HTTPoison.delete(headers)
    |> handle_response()
  end

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
end
