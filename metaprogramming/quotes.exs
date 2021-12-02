# Quote
quote_exp = quote do: sum(1, 2, 3)
IO.puts(inspect(quote_exp))

quote_exp = quote do: %{1 => 2}

IO.puts(inspect(quote_exp))

quote_exp = quote do: sum(1, sum(2 + 3, 2, 3), 4)

IO.puts(inspect(quote_exp))

# Quotes with the same result
IO.puts(inspect(quote do: :sum))

IO.puts(inspect(quote do: 1.0))

IO.puts(inspect(quote do: [1, 2, 3, 4, 5]))

IO.puts(inspect(quote do: "Hello world"))

IO.puts(inspect(quote do: {:a, 2}))

# Print quote as string

IO.puts(Macro.to_string(quote_exp))

# Unquote

number = 13

IO.puts(Macro.to_string(quote do: 11 + number))
IO.puts(Macro.to_string(quote do: 11 + unquote(number)))

inner = [3, 4, 5]
IO.puts(Macro.to_string(quote do: [1, 2, unquote(inner), 6]))
IO.puts(Macro.to_string(quote do: [1, 2, unquote_splicing(inner), 6]))

# Espace
map = %{hello: :world}
IO.puts(inspect(Macro.escape(map)))

require Unless

Unless.macro_unless(true, do: IO.puts("this should never be printed"))
Unless.fun_unless(true, do: IO.puts("this should never be printed"))

# expand_once
expr = quote do: Unless.macro_unless(true, do: IO.puts("this should never be printed"))
res = Macro.expand_once(expr, __ENV__)
IO.puts(Macro.to_string(res))

defmodule Hygiene do
  defmacro no_interference do
    quote do: a = 1
  end

  defmacro interference do
    quote do: var!(a) = 1
  end
end

defmodule HygieneTest do
  def go do
    require Hygiene
    a = 13
    Hygiene.no_interference()
    Hygiene.interference()
    a
  end
end

defmodule Sample do
  def quoted do
    quote do: x
  end

  defmacro initialize_to_char_count(variables) do
    Enum.map(variables, fn name ->
      var = Macro.var(name, nil)
      length = name |> Atom.to_string() |> String.length()

      quote do
        unquote(var) = unquote(length)
      end
    end)
  end

  def run do
    initialize_to_char_count([:red, :green, :yellow])
  end
end

IO.puts(HygieneTest.go())

IO.puts(inspect(quote do: x))
IO.puts(inspect(Sample.quoted()))

IO.puts(inspect(Sample.run()))

defmodule MyTest do
  use TestCase

  test "hello" do
    "hello" = "world"
  end
end

MyTest.run()
