defmodule JsonPlaceholder.Photo do
  @path_base "photos"
  alias JsonPlaceholder.API.Base, as: API

  def all() do
    API.get(@path_base)
  end

  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
