defmodule TwilixrTest do
  use ExUnit.Case
  doctest Twilixr

  test "Client Token retrieved from Config/Config.exs" do
    assert Twilixr.bot_secret() == Application.get_env(:twilixr, :client_secret)
  end

  test "Empty scope concats empty string" do
    assert Twilixr.concatScopes() == ""
  end
  
end
