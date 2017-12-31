defmodule One do
  @moduledoc """
  advent of code, day 1
  """
  def captcha(nums) do
    l = Integer.to_string(nums) 
        |> String.graphemes 
        |> Enum.map(fn x -> String.to_integer(x) end)
        |> Enum.with_index
    [first | _ ] = l
    l
      |> Enum.filter(fn x ->
          {val, i} = x
          n = case Enum.fetch(l, i + 1) do
            {:ok, next} ->
              next
            :error -> 
              first
          end

          {nval, _} = n
          val == nval
      end)
      |> Enum.map(fn x ->
        {val, _} = x
        val
      end)
      |> Enum.sum

  end
end
