defmodule DialProyect do
  @moduledoc """
  Documentation for `DialProyect`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DialProyect.hello()
      :world

  """
  @spec sum_times(integer) :: integer
  def sum_times(a) do
    [1, 2, 3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
    |> round
  end
end
