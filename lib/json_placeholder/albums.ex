defmodule JsonPlaceholder.Album do
  @path_base "albums"
  alias JsonPlaceholder.API.Base, as: API

  @doc """
  Get all albums.  Albums may be filtered by providing a map of query parameters.

  ```
  JsonPlaceholder.Album.all(%{"userId" => 1})
  ```
  """
  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(query \\ %{}) do
    API.get(@path_base, query)
  end

  @doc """
  Get a single album by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end

  @doc """
  Get the related `relation` for `id`. The relation should be
  specified as an atom.

  Currently available relations for `album`: `:photos`.
  """

  @spec get_related(integer(), atom()) :: struct()
  def get_related(id, :photos) do
    "#{@path_base}/#{inspect(id)}/photos"
    |> API.get()
  end
end

