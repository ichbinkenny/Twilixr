defmodule TwilixrTest do
  use ExUnit.Case
  doctest Twilixr

  test "Client Token retrieved from Config/Config.exs" do
    assert Twilixr.bot_token() == Application.get_env(:twilixr, :client_token)
  end
  
end
