defmodule EsmePool.Connection do
  @moduledoc false

  require Logger

  def start_link([host, port, system_id, password]) do
    Logger.info("Connecting to #{host}:#{port}")
    {:ok, esme} = SMPPEX.ESME.Sync.start_link(host, port)
    Logger.info("Binding Transmitter")
    bind = SMPPEX.Pdu.Factory.bind_transmitter(system_id, password)
    {:ok, bind_resp} = SMPPEX.ESME.Sync.request(esme, bind)
    Logger.info("Transmitter bounded #{inspect bind_resp}")
    {:ok, esme}
  end

  def send_message(esme, from, to, text) do
    submit_sm = SMPPEX.Pdu.Factory.submit_sm(from, to, text)
    {:ok, submit_sm_resp} = SMPPEX.ESME.Sync.request(esme, submit_sm)
  end
end
