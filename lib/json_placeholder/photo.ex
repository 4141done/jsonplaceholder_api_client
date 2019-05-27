defmodule JsonPlaceholder.Photo do
  @path_base "photos"
  alias JsonPlaceholder.API.Base, as: API

  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(query \\ %{}) do
    API.get(@path_base, query)
  end


  @doc """
  Get a single photo by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end

  def get_related(id, :albums) do
    "#{@path_base}/#{inspect(id)}/albums"
  end
end

