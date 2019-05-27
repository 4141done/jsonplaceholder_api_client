defmodule JsonPlaceholder.Todo do
  @path_base "todos"
  alias JsonPlaceholder.API.Base, as: API

  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(query \\ %{}) do
    API.get(@path_base, query)
  end

  @doc """
  Get a single todo by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
