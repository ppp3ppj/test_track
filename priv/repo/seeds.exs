# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TestTrack.Repo.insert!(%TestTrack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#alias TestTrack.Repo
alias TestTrack.Accounts.User

users = [
  %{
    name: "Alice",
    email: "alice@example.com",
    password: "111111111111",
  }
]

# Insert users into the database
for user_attrs <- users do
  case TestTrack.Accounts.register_user(user_attrs) do
    {:ok, user} -> IO.puts("User #{user.email} created")
    {:error, changeset} -> IO.inspect(changeset.errors, label: "Error creating user")
  end
end

