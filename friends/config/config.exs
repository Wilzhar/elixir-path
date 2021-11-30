import Config

config :friends, ecto_repos: [Friends.Repo]

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "postgres",
  password: "password",
  hostname: "localhost"
