defmodule Five do
  @moduledoc """
  Advent of Code, day five
  """

  @input_file "five.txt"

  def read_input_file do
    case File.read(@input_file) do
      {:ok, body} ->
        body
      {:error, reason} ->
        raise reason
    end
  end


  @doc """
  Parse columnar list string `jumps` into list of integers
  """
  def parse_jumps(jumps) do
    jumps
    |> String.split("\n", trim: :true)
    |> Enum.map(fn x ->
      x
      |> String.trim
      |> String.to_integer
    end)
  end

  @doc """
  Take the `jumps` list and pass default parameters to cycle_jumps/3
  """
  def cycle_jumps(jumps) do
    start_index = 0
    step = 0

    cycle_jumps(jumps, start_index, step) 
  end

  @doc """
  Take `jumps`, `index`, `step` and either 
    generate the next state
    or return the steps taken
  """
  def cycle_jumps(jumps, index, step) do
    case Enum.fetch(jumps, index) do
      {:ok, pointer_val} ->
        next_jumps = List.replace_at(jumps, index, pointer_val + 1)
        cycle_jumps(next_jumps, index + pointer_val, step + 1)
      :error -> step
    end
  end

  def solve_part_one do
    IO.inspect(read_input_file()) |> solve_part_one
  end

  def solve_part_one(str) do 
    str
    |> parse_jumps
    |> cycle_jumps
  end
end
