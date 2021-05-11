defmodule Inmana.Welcomer do

  def welcome(%{"name" => name, "age" => age})do
    # Receber um nome e uma idade do usuario
    # Se o usuario chamar banana e idade 42 , recebe uma mensagem especial
    # Se o usuario for maior de idade recebe uma mensagem normal
    # se for menor de idade, recebe um erro
    # Tratar o nome para entradas erradas, como BaNaNa ou afins

    age = String.to_integer(age)

    name |> String.trim() |> String.downcase() |> evaluate(age)

  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
