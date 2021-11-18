# Match operator

{a, b, c} = {:Hello, "world", 42}

IO.puts("{a, b, c} = {:Hello, \"world\", 42};")

IO.puts("a: #{a}")
IO.puts("b: #{b}")
IO.puts("c: #{c}")

IO.puts("")

["1", g, h] = ["1", "2", "3"]

IO.puts("[\"1\", g, h] = [\"1\", \"2\", \"3\"]")
IO.puts("g: #{g}")
IO.puts("h: #{h}")

IO.puts("")

[g, ^h] = ["4", "3"]
IO.puts("[g, ^h] = [\"4\", \"3\"]")
IO.puts("g: #{g}")
IO.puts("h: #{h}")
IO.puts("")

[head | _] = [1, 2, 3]
IO.puts("[head | _] = [1, 2, 3]")
IO.puts("head: #{head}")

# case, cond, if
case {h, g} do
  {"5", i} -> IO.puts("{h, g} match with {\"5\", i}")
  {"3", _} -> IO.puts("{h, g} match with {\"3\", _}")
  _ -> IO.puts("Default match (_)")
end

IO.puts("")

color = "Yellow"

IO.puts("color: #{color}")

case color do
  "Orange" -> IO.puts("The color is Orange")
  "Red" -> IO.puts("The color is Red")
  "Blue" -> IO.puts("The color is Blue")
  _ -> IO.puts("The color doesn't match with anything")
end

IO.puts("")

case {head, g, a} do
  {j, "4", :Hello} when j == 1 -> IO.puts("j is equals to 1")
  _ -> IO.puts("Default match (_)")
end

IO.puts("")

f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end

IO.puts("f.(1, 3)")
IO.puts(f.(1, 3))

IO.puts("f.(-1, 3)")
IO.puts(f.(-1, 3))

IO.puts("")

cond do
  head < 0 -> IO.puts("head is lower than 0")
  head == 1 -> IO.puts("head is equals to 1")
  true -> IO.puts("This is equivalent to else")
end

IO.puts("")

bool_var = true

if bool_var do
  IO.puts("bool_var is #{bool_var}")
else
  IO.puts("bool_var is #{bool_var}")
end

bool_var = not bool_var

unless bool_var do
  IO.puts("bool_var is #{bool_var}")
end

<<char::utf8, rest::binary>> = "über"

IO.puts("<<char::utf8, rest::binary>> = \"über\"")
IO.puts("char == ?ü: #{char == ?ü}")
