# Enum
list = Enum.map([4, 6, 8, 9], fn x -> x * x end)

IO.puts(inspect(list))

# Filter
positive? = &(&1 >= 0)

filteredList = Enum.filter(-10..10, positive?)

IO.puts(inspect(filteredList))

# pipe operator
sum = -10..10 |> Enum.map(&(&1 * 2)) |> Enum.filter(positive?) |> Enum.sum()
IO.puts("The sum is #{sum}")

# stream
list2 = -10..10 |> Stream.map(&(&1 * 2)) |> Stream.filter(positive?)
IO.puts(inspect(list2))
IO.puts("\n")

# Task
IO.puts("Starting asynchronous task")

task =
  Task.async(fn ->
    IO.puts("waiting respond")
    :timer.sleep(5000)
    IO.puts("Message from asynchronous task")
  end)

Task.await(task, 7000)
IO.puts("Message after asynchronous task")

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

{:ok, pid} = KV.start_link()

IO.puts("Put request")
IO.puts(inspect(send(pid, {:put, :hello, :world})))
IO.puts("")

IO.puts("Get request")
IO.puts(inspect(send(pid, {:get, :hello, self()})))
IO.puts("")

# Reading files
IO.puts("The file content is")
stream = File.stream!("file.txt")

%File.Stream{
  line_or_bytes: :line,
  modes: [:raw, :read_ahead, :binary],
  path: "file.txt",
  raw: true
}

IO.puts(inspect(Enum.take(stream, 10)))

IO.puts(inspect(File.read!("file.txt")))

IO.puts(Path.join("hello", "world"))

IO.puts("")

IO.puts("the file path of file.txt is #{Path.expand("~/file.txt")}")
IO.gets("Do you want continue?\nyes or not?")
