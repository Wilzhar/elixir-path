# Importing function from Modules in util.ex file
# Note: you need to compile util.ex in order to import its functions
# use elixirc filename.ex command to compile files
alias Util.{Math, Str}
IO.puts(Math.sum(2, 4))
IO.puts(Str.join("Wilmar", "Valencia", "-"))
IO.puts(Str.join("Wilmar", "Valencia"))
IO.puts(Str.join2("Wilmar", "S.", "Valencia"))

math_struct = %Math{sqrt: "sqrt"}

IO.puts(inspect(math_struct))
IO.puts(inspect(%Str{}))

# Updating struct from Util.Math module
updated_math_struct = %{math_struct | mod: "%"}

IO.puts(inspect(updated_math_struct))

IO.puts(inspect(Map.keys(updated_math_struct)))
