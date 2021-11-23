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

error2 =
  try do
    # This will throw an error
    throw("Unexpect error")
  catch
    error -> "An error has ocurred: #{error}"
  end

IO.puts(error2)

error3 =
  try do
    exit("I am exiting")
  catch
    :exit, _ -> "not really"
  end

IO.puts(error3)
