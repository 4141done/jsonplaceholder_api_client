defmodule JsonPlaceholder.User do
  @path_base "users"
  alias JsonPlaceholder.API.Base, as: API

  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(query \\ %{}) do
    API.get(@path_base, query)
  end

  @doc """
  Get a single user by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id, params \\ %{}) do
    API.get("#{@path_base}/#{inspect(id)}", params)
  end

  @doc """
  Get the related `relation` for `id`. The relation should be
  specified as an atom.

  Currently available relations for `user`: `:albums`, `:todos`, `:posts`.

  You can also find resources related to a certain user from the resource module like this:

  ```
  JsonPlaceholder.Album.all(%{"userId" => 2})
  ```
  """

  @spec get_related(integer(), atom()) :: struct()
  def get_related(id, :albums) do
    "#{@path_base}/#{inspect(id)}/albums"
    |> API.get()
  end

  def get_related(id, :todos) do
    "#{@path_base}/#{inspect(id)}/todos"
    |> API.get()
  end

  def get_related(id, :posts) do
    "#{@path_base}/#{inspect(id)}/posts"
    |> API.get()
  end
end
