defmodule ToyApp.Posts.Micropost do
  alias ToyApp.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "microposts" do
    field :content, :string
    belongs_to :user, User


    timestamps()
  end

  @doc false
  def changeset(micropost, attrs) do
    micropost
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> validate_length(:content, min: 5, max: 280)
  end
end
