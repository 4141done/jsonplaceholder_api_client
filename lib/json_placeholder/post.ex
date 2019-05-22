defmodule JsonPlaceholder.Post do
  @moduledoc """
  Represents standard REST calls to the `/posts` endpoint of
  the jsonplaceholder API.

  `post` objects have associated `comments` and belong to `users`
  """
  @path_base "posts"

  alias JsonPlaceholder.API.Base, as: API
  alias JsonPlaceholder.API.Response

  def all(params) do
    @path_base
    |> API.get(params)
  end

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
  Get the related `relation` for `post_id`. The relation should be
  specified as an atom.

  Currently available relations for `post`: `:comments`.

  Dev notes:  Hopefully this can provide a consistent API for getting relations
  that is easily mockable.  For our pretend situation where we maintain the
  API and the client library is versioned, it seems ok to release a new version
  if and when we add a new relation as existing implementations won't be relying
  on it anyway.

  It does however not allow discovery of the allowed relations via tab completion.
  This can be remedied by providing detailed docs and typespecs
  """

  @spec get_related(integer(), :comments) :: struct()
  def get_related(id, :comments) do
    "#{@path_base}/#{inspect(id)}/comments"
    |> API.get()
  end

  def get_related(post_id, relation) do
    {:error,
     %Response{
       error: :bad_relation,
       message:
         "No relation #{inspect(relation)} exists for resource #{inspect(__MODULE__)} having id #{
           inspect(post_id)
         }"
     }}
  end
end
