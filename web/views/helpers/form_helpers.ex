defmodule Whitebox.FormHelpers do

  use Phoenix.HTML, only: [tag: 2]

  def form_group_tag_with_error(form, field, do: block) do
    class = case form.errors[field] do
      nil -> "form-group"
      _   -> ~w(form-group has-error) |> Enum.join(" ")
    end
    content_tag(:div, [class: class], [do: block])
  end

end
