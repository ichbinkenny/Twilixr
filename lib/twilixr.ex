defmodule Twilixr do
  @moduledoc """
  Documentation for `Twilixr`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Twilixr.hello()
      :world

  """
  def hello do
    :world
  end

  def bot_token(), do: Application.get_env(:twilixr, :client_token)

end
