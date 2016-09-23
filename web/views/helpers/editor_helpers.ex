defmodule Whitebox.EditorHelpers do

  def a_few_words(text) do
    a_few_words(text, 20)
  end

  def a_few_words(text, max_words) do
    text
      |> String.split(~r([\s\.\,\-\n\t]))
      |> Enum.take(max_words)
      |> Enum.join(" ")
  end

end
