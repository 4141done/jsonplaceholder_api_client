defmodule JsonPlaceholder.API.Response do
  # TODO: likely will need to add response headers
  defstruct [:error, :raw_body, :parsed_body, :message, :status_code]

  alias Jason, as: JsonLib

  def decode_json(%__MODULE__{raw_body: raw_body} = response) do
    case JsonLib.decode(raw_body) do
      {:ok, reason} ->
        %__MODULE__{response | parsed_body: reason}

      {:error, decode_error} ->
        %__MODULE__{response | parsed_body: nil, message: decode_error.message}
    end
  end

  def assign_error(%__MODULE__{status_code: status_code} = response) do
    status_atom =
      case status_code do
        501 ->
          :not_implemented

        502 ->
          :bad_gateway

        503 ->
          :service_unavailable

        401 ->
          :unauthorized

        403 ->
          :forbidden

        404 ->
          :not_found

        code when code >= 400 and code <= 499 ->
          :bad_request

        code when code >= 500 and code <= 599 ->
          :internal_server_error

        _ ->
          nil
      end

    %__MODULE__{response | error: status_atom}
  end
end
