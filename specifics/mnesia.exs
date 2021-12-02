alias :mnesia, as: Mnesia
Mnesia.create_schema([node()])

# Set up

Mnesia.start()

Mnesia.create_table(Person, attributes: [:id, :name, :job])

# Dirty way

Mnesia.dirty_write({Person, 1, "Seymour Skinner", "Principal"})
Mnesia.dirty_write({Person, 2, "Homer Simpson", "Safety Inspector"})
Mnesia.dirty_write({Person, 3, "Moe Szyslak", "Bartender"})

IO.inspect(Mnesia.dirty_read({Person, 1}))
IO.inspect(Mnesia.dirty_read({Person, 2}))
IO.inspect(Mnesia.dirty_read({Person, 3}))
IO.inspect(Mnesia.dirty_read({Person, 4}))

# Transactions

data_to_write = fn ->
  Mnesia.write({Person, 4, "Marge Simpson", "home maker"})
  Mnesia.write({Person, 5, "Hans Moleman", "unknown"})
  Mnesia.write({Person, 6, "Monty Burns", "Businessman"})
  Mnesia.write({Person, 7, "Waylon Smithers", "Executive assistant"})
end

Mnesia.transaction(data_to_write)

data_to_read = fn ->
  Mnesia.read({Person, 6})
end

IO.inspect(Mnesia.transaction(data_to_read))

Mnesia.transaction(fn ->
  Mnesia.write({Person, 5, "Hans Moleman", "Ex-Mayor"})
end)

Mnesia.add_table_index(Person, :job)

IO.inspect(
  Mnesia.transaction(fn ->
    Mnesia.index_read(Person, "Principal", :job)
  end)
)

IO.inspect(
  Mnesia.transaction(fn ->
    Mnesia.match_object({Person, :_, "Marge Simpson", :_})
  end)
)

# Adding new column to the table Person
case Mnesia.create_table(Person, attributes: [:id, :name, :job, :age]) do
  {:atomic, :ok} ->
    Mnesia.add_table_index(Person, :job)
    Mnesia.add_table_index(Person, :age)

  {:aborted, {:already_exists, Person}} ->
    case Mnesia.table_info(Person, :attributes) do
      [:id, :name, :job] ->
        Mnesia.wait_for_tables([Person], 5000)

        Mnesia.transform_table(
          Person,
          fn {Person, id, name, job} ->
            {Person, id, name, job, 21}
          end,
          [:id, :name, :job, :age]
        )

        Mnesia.add_table_index(Person, :age)

      [:id, :name, :job, :age] ->
        :ok

      other ->
        {:error, other}
    end
end

data_to_read = fn ->
  Mnesia.read({Person, 6})
end

IO.inspect(Mnesia.transaction(data_to_read))
