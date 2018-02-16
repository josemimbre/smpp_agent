defmodule EsmePool do
  @moduledoc """
  Documentation for EsmePool.
  """

  defmodule Message do
    @moduledoc false
    defstruct from: nil,
              to: nil,
              text: nil
  end

  def send_message(%Message{from: from, to: to, text: text}) do
    :poolboy.transaction(:esme_pool, fn esme ->
      EsmePool.Connection.send_message(esme, from, to, text)
    end)
  end
end
