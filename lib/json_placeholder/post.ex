defmodule JsonPlaceholder.Post do
  @path_base "posts"
  alias JsonPlaceholder.API.Base, as: API

  def all() do
    API.get(@path_base)
  end

  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
