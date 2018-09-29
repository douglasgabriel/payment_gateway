defmodule EthereumService.Etherscan.Client do
  @moduledoc """

  """

  @etherscan_url "https://api.etherscan.io/api?"

  @doc """

  """
  def request(url, method) do
    { status, response } = apply(HTTPoison, method, [@etherscan_url <> url])

    { status, parse(response.body) }
  end

  @doc """

  """
  defp mount_response_from_etherscan(response) do
    %{ "result" => result, "message" => message } = parse(response.body)

    case result do
      %{ "isError" => "1", "errDescription" => errDescription } ->
        {:error, errDescription}
      _ ->
        {:ok, message}
    end
  end

  defp parse(body) do
    { :ok, body } = Poison.decode(body)
    body
  end
end