defmodule JsonPlaceholder.Post do
  @moduledoc """
  Represents standard REST calls to the `/posts` endpoint of
  the jsonplaceholder API.

  `post` objects have associated `comments` and belong to `users`
  """
  @path_base "posts"

  alias JsonPlaceholder.API.Base, as: API

  @spec all(map()) :: %JsonPlaceholder.API.Response{}
  def all(query \\ %{}) do
    API.get(@path_base, query)
  end

  @doc """
  Get a post album by `id`.
  """
  @spec get(term(), map()) :: %JsonPlaceholder.API.Response{}
  def get(id) do
    "#{@path_base}/#{inspect(id)}"
    |> API.get()
  end

  def create(new_post) do
    @path_base
    |> API.post(new_post)
  end

  def update(id, updated_post) do
    "#{@path_base}/#{inspect(id)}"
    |> API.put(updated_post)
  end

  def delete(id) do
    "#{@path_base}/#{inspect(id)}"
    |> API.delete()
  end

  @doc """
  Get the related `relation` for `id`. The relation should be
  specified as an atom.

  Currently available relations for `post`: `:comments`.
  """

  @spec get_related(integer(), atom()) :: struct()
  def get_related(id, :comments) do
    "#{@path_base}/#{inspect(id)}/comments"
    |> API.get()
  end
end
