defmodule EthereumService.Etherscan.Client do
  @moduledoc """
  Provides comunication with Etherscan API
  """

  @etherscan_url "https://api.etherscan.io/api?"

  @doc """
  Requests resources from Etherscan API

  Returns `{ http status, response body }`

  ## Examples

    `EthereumService.Etherscan.Client("module=transaction&action=gettxreceiptstatus&txhash=<txhash>", :get)`
    { :ok, %{"message" => "OK", "result" => %{"status" => "1"}, "status" => "1"} }

  """
  def request(url, method) do
    { status, response } = apply(HTTPoison, method, [@etherscan_url <> url])

    { status, parse(response.body) }
  end

  defp parse(body) do
    { :ok, body } = Poison.decode(body)
    body
  end
end
