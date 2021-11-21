defmodule Util do
  defmodule Math do
    @moduledoc """
    Provides math-related functions.

    ## Examples

        iex> Math.sum(1, 2)
        3

    """

    @enforce_keys [:sqrt]
    defstruct [:mod, :sqrt, sum: "+", sub: "-", mul: "*", div: "/"]

    @doc """
    Calculates the sum of two numbers.
    """
    def sum(a, b), do: a + b
  end

  defmodule Str do
    @moduledoc """
    Provides strings management.

    ## Examples

        iex> Str.join("Hello", "World", "-")
        "Hello-World"

    """

    @separator " "

    defstruct name: "John", age: 27

    @doc """
    Join two string with the given separator (" " by default)
    """
    def join(a, b, separator \\ get_separator()) do
      a <> separator <> b
    end

    @doc """
    Join three string with the given separator (" " by default)
    """
    def join2(a, b, c, separator \\ get_separator()) do
      a <> separator <> b <> separator <> c
    end

    @doc """
    Get @separator value
    """
    defp get_separator() do
      @separator
    end
  end
end