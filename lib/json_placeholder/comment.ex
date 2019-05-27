defmodule JsonPlaceholder.Comment do
  @path_base "comments"
  alias JsonPlaceholder.API.Base, as: API

  @doc """
  Get all commens.  Comments may be filtered by providing a map of query parameters.

  ```
  JsonPlaceholder.Comment.all(%{"userId" => 1})
  ```
  """
  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(params \\ %{}) do
    API.get(@path_base, params)
  end

  @doc """
  Get a single comment by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
