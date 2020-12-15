defmodule Twilixr do
  @moduledoc """
  Documentation for `Twilixr`.
  """

  def bot_id(), do: Application.get_env(:twilixr, :client_id)
  def bot_secret(), do: Application.get_env(:twilixr, :client_secret)
  def bot_scopes(), do: Application.get_env(:twilixr, :needed_scopes)
  def bot_token(), do: Application.get_env(:twilixr, :access_token)

  def base_url(), do: "https://api.twitch.tv/helix/search/"
  def app_auth_url(), do: "https://id.twitch.tv/oauth2/token?client_id=#{bot_id()}&client_secret=#{bot_secret()}&grant_type=client_credentials"
  def token_revoke_url(), do: "https://id.twitch.tv/oauth2/revoke?client_id=#{bot_id}&token="
  def channels_tag(), do: "channels"
  def query_tag(), do: "?query="
  def default_headers(), do: ["client-id": bot_id(), "Authorization": "Bearer #{bot_token()}"]

  def get_app_access_token() do
    if bot_token() != nil do
      bot_token()
    else
      case HTTPoison.post(app_auth_url(), "", default_headers()) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> { 
          case Poison.decode(~s(#{body})) do
            {:ok, data} -> IO.puts("Please add the token: #{data["access_token"]} to your config file as access_token: \"TOKEN HERE\",")
            _ -> IO.puts("I was unable to parse the response received from Twitch.TV. Please try again!")
          end
        }
        _ -> IO.puts("I was unable to get an access code. Please check your provided id and secret in the config file.")
      end
    end
  end

  def revoke_app_access_token(token) do
    case HTTPoison.post(token_revoke_url <> token, "", default_headers) do
    {:ok, _} -> :ok
    _ -> :error
    end
  end

  def is_streamer_live(_username) do

  end

  def concat_scopes() do
    {_, scope_str} = Enum.map_reduce(bot_scopes(), "", fn scope, acc -> acc <> "%20" <> scope end)
    scope_str
  end

end
