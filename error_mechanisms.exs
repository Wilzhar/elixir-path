defmodule MyError do
  # Custom error
  defexception message: "Unexpected error!"
end

# Try, catch and rescue

# try - rescue is used when you want to log an error
error =
  try do
    raise "oops"
  rescue
    e in RuntimeError -> e
  end

IO.puts(inspect(error))

# throw is used when you want to retrieve values and catch it later
error2 =
  try do
    # This will throw an error
    throw("Unexpect error")
  catch
    error -> "An error has ocurred: #{error}"
  end

IO.puts(error2)

# Exit is used when the process finish
error3 =
  try do
    exit("I am exiting")
  catch
    :exit, _ -> "not really"
  end

IO.puts(error3)

# Erlang libraries

# returns Unicode codepoint
IO.puts(inspect(String.to_charlist("Ø")))

# deals with raw data bytes
IO.puts(inspect(:binary.bin_to_list("Ø")))

# Crypto module
IO.puts(inspect(Base.encode16(:crypto.hash(:sha256, "Wilmar Valencia"))))

# Diagraph module
digraph = :digraph.new()
coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
[v0, v1, v2] = for c <- coords, do: :digraph.add_vertex(digraph, c)
:digraph.add_edge(digraph, v0, v1)
:digraph.add_edge(digraph, v1, v2)
short_path = :digraph.get_short_path(digraph, v0, v2)

IO.puts(inspect(short_path))

# Erlang Term Storage
table = :ets.new(:ets_test, [])

:ets.insert(table, {"China", 1_374_000_000})
:ets.insert(table, {"India", 1_284_000_000})
:ets.insert(table, {"USA", 322_000_000})
:ets.i(table)

# math module
IO.puts(:math.pi())
IO.puts(:math.sin(90))
IO.puts(:math.exp(4))
IO.puts(:math.pow(2, 8))

# queue module
queue = :queue.new()
queue = :queue.in("First", queue)
queue = :queue.in("Second", queue)
queue = :queue.in("Third", queue)

{value, queue} = :queue.out(queue)
IO.puts(inspect(value))

{value, queue} = :queue.out(queue)
IO.puts(inspect(value))

{value, queue} = :queue.out(queue)
IO.puts(inspect(value))

{value, queue} = :queue.out(queue)
IO.puts(inspect(value))

# rand module
IO.puts(:rand.uniform())
IO.puts(:rand.uniform())
IO.puts(:rand.uniform())
