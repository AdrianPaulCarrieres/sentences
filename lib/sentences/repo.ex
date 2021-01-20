defmodule Sentences.Repo do
  use Ecto.Repo,
    otp_app: :sentences,
    adapter: Ecto.Adapters.Postgres
end
