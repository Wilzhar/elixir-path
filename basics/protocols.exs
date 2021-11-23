alias User
alias Size

# Protocols
IO.puts("Protocols")
IO.puts(Size.size("foo"))
IO.puts(Size.size({:ok, "hello"}))
IO.puts(Size.size(%{label: "some label"}))

IO.puts(Size.size(%{}))

IO.puts(Size.size(%User{}))
IO.puts("")

# Comprehensions
IO.puts("Comprehensions")
words = ["hEllA", "rEd", "Rocks", "World", "PÉace"]

new_words =
  for word <- words do
    String.downcase(word)
  end

IO.puts(inspect(new_words))

IO.puts("")

# Regular expresion
IO.puts("Sigils")
regex = ~r/red|rocks/

filter_words =
  Enum.filter(new_words, fn word ->
    if word =~ regex do
      word
    end
  end)

IO.puts(inspect(filter_words))

string_1 = ~s(i'm going to do my "howework")
string_2 = "i'm going to do my \"homework\""

IO.puts("With ~s sigil: " <> string_1)
IO.puts("Without ~s sigil: " <> string_2)

char_1 = ~c(her name is 'Maria')
char_2 = 'her name is \'Maria\''

IO.puts('With ~c sigil: ' ++ char_1)
IO.puts('Without ~c sigil: ' ++ char_2)

other_words = ~w(shirt company monday) ++ filter_words

IO.puts(inspect(other_words))
IO.puts("")
# Date and time

date = ~D[2021-10-21]
IO.puts("the date is #{date}")
IO.puts("Year: #{date.year}, Month: #{date.month}, Day: #{date.day}")
IO.puts("")

time = ~T[08:21:07.1]
IO.puts("the time is #{time}")
IO.puts("Hour: #{time.hour}, Minute: #{time.minute}, Second: #{time.second}")
IO.puts("")

naive_date_time = ~N[2019-10-31 23:00:07]
IO.puts("The date and time is #{naive_date_time}")

IO.puts("""
Year: #{naive_date_time.year}, Month: #{naive_date_time.month}, Day: #{naive_date_time.day},
Hour: #{naive_date_time.hour}, Minute: #{naive_date_time.minute}, Second: #{naive_date_time.second}
""")

IO.puts("")

utc_date_time = ~U[2019-10-31 19:59:03Z]
IO.puts("The date and time is #{utc_date_time}")

IO.puts("""
Year: #{utc_date_time.year}, Month: #{utc_date_time.month}, Day: #{utc_date_time.day},
Hour: #{utc_date_time.hour}, Minute: #{utc_date_time.minute}, Second: #{utc_date_time.second},
Time zone: #{utc_date_time.time_zone}
""")
