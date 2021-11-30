defmodule Example do
  require EEx
  EEx.function_from_file(:def, :greeting, "greeting.eex", [:name])
end

IO.puts(Example.greeting("Sean"))

IO.puts(EEx.eval_string("Hi, <%= @name %>", assigns: [name: "Sean"]))

if_statement = """
<%= if condition do %>
  <%= a - b %>
<% else %>
  <%= b - a %>
<% end %>
"""

IO.puts(EEx.eval_string(if_statement, condition: false, a: 2, b: 1))
