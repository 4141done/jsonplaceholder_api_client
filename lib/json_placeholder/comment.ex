defmodule JsonPlaceholder.Comment do
  @path_base "comments"
  alias JsonPlaceholder.API.Base, as: API

  def all(params \\ %{}) do
    API.get(@path_base, params)
  end

  def get(id) do
    API.get("#{@path_base}/#{inspect(id)}")
  end
end
