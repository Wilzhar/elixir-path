# keyword list
points = [maria: 2, pedro: 3, juan: 2.2]

IO.puts("Maria has #{points[:maria]} points")

points = [ana: 4] ++ points

IO.puts("Ana has #{points[:ana]} points")

IO.inspect(points, label: "The keyword list is")

IO.puts("")

# map
map = %{:a => 2, 5 => :a}
IO.puts("map[:a]: #{map[:a]}")
IO.puts("map[5]: #{map[5]}")

IO.puts("Adding c: 2")
map = Map.put(map, :c, 2)

IO.puts("Updating c to 5")
map = %{map | c: 5}

IO.inspect(map, label: "The map is")
IO.puts("")

# Nested list

users = [
  developers: %{
    john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
    mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
  },
  admins: %{
    john: %{age: 27, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
    mary: %{age: 29, languages: ["Elixir", "F#", "Clojure"], name: "Mary"}
  }
]

IO.puts("Updating the age of the developer mary")
users = put_in(users[:developers].mary.age, 28)

IO.inspect(users, label: "The nested map is")

IO.puts("")
# Modules and functions
defmodule Util do
  def sum(a, b) do
    a + b
  end

  defp concat(a, b, separator) do
    a <> separator <> b
  end

  def greet(first_name, last_name, separator \\ " ") do
    full_name = concat(first_name, last_name, separator)
    "Hello #{full_name}!"
  end

  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

IO.puts(Util.sum(2, 5))
IO.puts(Util.greet("Wilmar", "Valencia", "_"))
IO.puts(Util.greet("Wilmar", "Valencia"))
IO.puts("")

IO.puts("Util.zero?(0)")
IO.puts(Util.zero?(0))

IO.puts("Util.zero?(1)")
IO.puts(Util.zero?(1))
IO.puts("")

# capture sintax
fun = &Util.sum/2
IO.puts("is_function(&Util.sum/2)")
IO.puts("fun.(2, 2): #{fun.(2, 2)}")
IO.puts(is_function(fun))

greetings = &"Hello #{&2} #{&1}!"
IO.puts(greetings.("Wilmar", "Valencia"))

# Recursion
defmodule Recursion do
  def factorial(n, accumulator) when n > 0 do
    factorial(n - 1, accumulator * n)
  end

  def factorial(0, accumulator) do
    accumulator
  end
end

IO.puts("The factorial of 5 is #{Recursion.factorial(5, 1)}")
