defmodule TwilixrTest do
  use ExUnit.Case
  doctest Twilixr

  test "Client Token retrieved from Config/Config.exs" do
    assert Twilixr.bot_token() == "2bfvp40ycc0oebzcjp5dhvj7lqovtw"
  end
  
end
