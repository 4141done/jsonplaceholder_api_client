defmodule JsonPlaceholder.User do
  @path_base "users"
  alias JsonPlaceholder.API.Base, as: API

  def all() do
    API.get(@path_base)
  end

  def get(id, params \\ %{}) do
    API.get("#{@path_base}/#{inspect(id)}", params)
  end
end
