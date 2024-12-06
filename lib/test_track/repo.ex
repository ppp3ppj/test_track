defmodule TestTrack.Repo do
  use Ecto.Repo,
    otp_app: :test_track,
    adapter: Ecto.Adapters.SQLite3
end
