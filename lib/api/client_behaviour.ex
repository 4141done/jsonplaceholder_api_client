defmodule JsonPlaceholder.API.ClientBehaviour do
  alias JsonPlaceholder.API.{Request, Response}

  @callback get(%Request{}) :: {:ok | :error, %Response{}}

  @callback post(%Request{}) :: {:ok | :error, %Response{}}

  @callback put(%Request{}) :: {:ok | :error, %Response{}}

  @callback delete(%Request{}) :: {:ok | :error, %Response{}}
end
