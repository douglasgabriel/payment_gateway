defmodule EthereumService.Etherscan.Transaction do
  @moduledoc """

  """

  alias EthereumService.Etherscan.Client

  @module_action_url "module=transaction&action="

  @doc """

  """
  def get_txreceipt_status(txhash) do
    request_txreceipt_status(txhash)
    |> mount_response
  end

  defp request_txreceipt_status(txhash) do
    @module_action_url <> "gettxreceiptstatus&txhash=" <> txhash
    |> Client.request(:get)
  end

  defp mount_response(response) do
    { request_status, request_response } = response

    case request_status do
      :error ->
        response
      :ok ->
        %{ "result" => %{ "status" => result_status } } = request_response

        case result_status do
          "1" ->
            :ok
          "0" ->
            :error
          "" ->
            :undefined
        end
    end
  end
end