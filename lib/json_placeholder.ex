defmodule JsonPlaceholder do
  @path_base "comments"
  alias JsonPlaceholder.API.Base, as: API

  def all() do
    API.get(@path_base)
  end

  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
