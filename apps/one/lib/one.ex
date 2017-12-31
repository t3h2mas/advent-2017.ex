defmodule One do
  @moduledoc """
  advent of code, day 1
  """
  def captcha(nums) do
    split_and_indexed = Integer.to_string(nums) 
        |> String.graphemes 
        |> Enum.map(fn x -> String.to_integer(x) end)
        |> Enum.with_index
    split_and_indexed 
      |> Enum.filter(fn x ->
          {val, i} = x
          n = case Enum.fetch(split_and_indexed, i + 1) do
            {:ok, next} ->
              next
            :error -> 
              Enum.at(split_and_indexed, 0)
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

  def captcha2(nums) do
    li = Integer.to_string(nums)
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    [start | _] = li
    worker(li, 0, start)
  end
  def worker([head | []], acc, start_head) do
    case head == start_head do
      :true ->
        acc + head
      :false ->
        acc
    end
  end
  def worker([head | tail], acc, start_head) do
    [next_head | _] = tail
    acc = case head == next_head do
      :true ->
        acc + head
      :false ->
        acc
    end
    worker(tail, acc, start_head)
  end
end
