
# Data types
int_var = 10;
float_var = 1.2;
atom_var = :hello;
string_var = "Wilmar";
hex_var = 0xFFF;
oct_var = 0o777;
bool_var = false;
bin_var = 0b1010;
list = ["hello", atom_var, 2, true];
tuple = { 4.2, :yes };
scientific_notation = 1.0e15;


#Operators

IO.puts("Strings concatenation to_string(#{atom_var} <> #{string_var})");
IO.puts(to_string(atom_var) <> " " <> string_var);
IO.puts("");

IO.puts("Addition: #{int_var} + #{float_var}");
IO.puts(int_var + float_var);
IO.puts("");

IO.puts("Addition: #{float_var} + 0b1010");
IO.puts(float_var + bin_var);
IO.puts("");

IO.puts("Rounding 1.2");
IO.puts(round(float_var));
IO.puts("");

IO.puts("Trunc 2.9");
IO.puts(trunc(2.9));
IO.puts("");


IO.puts("Dividing using / operator");
IO.puts(10 / 2);
IO.puts("");

IO.puts("Dividing using div/2 function");
IO.puts(div(10, 2));
IO.puts("");

IO.puts("is_boolean #{scientific_notation}");
IO.puts(is_boolean(scientific_notation));
IO.puts("");

IO.puts("is_boolean #{bool_var}");
IO.puts(is_boolean(bool_var));
IO.puts("");

#anonymous functions
add = fn a, b -> a + b end;
IO.puts("Anonymous functions");
IO.puts(add.(5, 6));
IO.puts("");

#list and tuples
IO.puts("list length");
IO.puts(length list);
IO.puts("");

IO.puts("head of [\"hello\", :hello, 2, true]");
IO.puts(hd(list));
IO.puts("");

IO.puts("tuple size");
IO.puts(tuple_size(tuple));
IO.puts("");

IO.puts("get an element in a tuple");
IO.puts(elem(tuple, 1));
IO.puts("");
