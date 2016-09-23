defmodule Whitebox.PostView do
  use Whitebox.Web, :view
  import Whitebox.FormHelpers, only: [
    form_group_tag_with_error: 3
  ]
  import Whitebox.EditorHelpers, only: [
    a_few_words: 1,
    a_few_words: 2
  ]
end
