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

    @typedoc """
    Just a number
    """
    @type num :: integer

    @doc """
    Calculates the sum of two numbers.
    """
    @spec sum(num, num) :: num
    def sum(a, b), do: a + b
  end

  defmodule Str do
    @moduledoc """
    Provides strings management.

    ## Examples

        iex> Str.join("Hello", "World", "-")
        "Hello-World"

    """

    defstruct name: "John", age: 27

    @typedoc """
    A string usually write as word, e.g. "word"
    """
    @type word :: String.t()

    @typedoc """
    A bunch of words joined using a separator
    """
    @typep joined_word :: String.t()

    @typedoc """
    A string character used for separate two words, by default is a single space
    """
    @type sep_type :: String.t()

    @separator " "

    @doc """
    Join two string with the given separator (" " by default)
    """
    @spec join(word, word, sep_type) :: joined_word
    def join(a, b, separator \\ get_separator()) do
      a <> separator <> b
    end

    @doc """
    Join three string with the given separator (" " by default)
    """
    @spec join2(word, word, word, sep_type) :: joined_word
    def join2(a, b, c, separator \\ get_separator()) do
      a <> separator <> b <> separator <> c
    end

    @spec get_separator() :: sep_type
    defp get_separator() do
      @separator
    end
  end
end
