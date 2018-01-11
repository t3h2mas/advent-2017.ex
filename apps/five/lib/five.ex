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
    read_input_file() |> solve_part_one
  end

  def solve_part_one(str) do 
    str
    |> parse_jumps
    |> cycle_jumps
  end

  #
  # part two
  #

  @doc """
  Take the `jumps` list and pass default parameters to cycle_jumps2/3
  """
  def cycle_jumps2(jumps) do
    start_index = 0
    step = 0

    cycle_jumps2(jumps, start_index, step) 
  end

  def cond_inc_or_dec(val) do
    case val > 2 do
      :true -> val - 1
      :false -> val + 1
    end
  end

  @doc """
  Take `jumps`, `index`, `step` and either 
    generate the next state
    or return the steps taken
  """
  def cycle_jumps2(jumps, index, step) do
    case Enum.fetch(jumps, index) do
      {:ok, pointer_val} ->
        next_jumps = List.replace_at(jumps, index, cond_inc_or_dec(pointer_val))
        cycle_jumps2(next_jumps, index + pointer_val, step + 1)
      :error -> step
    end
  end

  def solve_part_two do
    read_input_file() |> solve_part_two
  end

  def solve_part_two(str) do 
    str
    |> parse_jumps
    |> cycle_jumps2
  end
end
