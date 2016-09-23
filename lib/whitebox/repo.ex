defmodule Whitebox.Repo do
  use Ecto.Repo, otp_app: :whitebox
  use Scrivener, page_size: 10
end
