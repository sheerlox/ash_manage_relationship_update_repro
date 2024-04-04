defmodule AshReproTest do
  use ExUnit.Case

  alias AshRepro.Profiles
  alias AshRepro.Profiles.Profile

  # create a profile with a user for each test (working as expected)
  setup do
    profile =
      Profile
      |> Ash.Changeset.for_create(:create, %{
        contact_email: "john@doe.com",
        user: %{firstname: "John", lastname: "Doe"}
      })
      |> Profiles.create!()

    {:ok, profile: profile}
  end

  test "updates user through managed relationship - #1", %{profile: profile} do
    profile
    |> Ash.Changeset.for_update(
      :update,
      %{
        contact_email: "updated@updated.com",
        user: %{profile.user | firstname: "UPDATED", lastname: "UPDATED"}
      }
    )
    |> Profiles.update!()

    updated_profile = Profiles.get!(Profile, profile.id, load: [:user])

    assert updated_profile.user.firstname == "UPDATED"
    assert updated_profile.user.lastname == "UPDATED"
  end

  test "updates user through managed relationship - #2", %{profile: profile} do
    profile
    |> Ash.Changeset.for_update(:update,
      user: %{profile.user | firstname: "UPDATED", lastname: "UPDATED"}
    )
    |> Profiles.update!()

    updated_profile = Profiles.get!(Profile, profile.id, load: [:user])

    assert updated_profile.user.firstname == "UPDATED"
    assert updated_profile.user.lastname == "UPDATED"
  end

  test "updates user through managed relationship - #3", %{profile: profile} do
    profile
    |> Ash.Changeset.for_update(:update,
      user: %{id: profile.user.id, firstname: "UPDATED", lastname: "UPDATED"}
    )
    |> Profiles.update!()

    updated_profile = Profiles.get!(Profile, profile.id, load: [:user])

    assert updated_profile.user.firstname == "UPDATED"
    assert updated_profile.user.lastname == "UPDATED"
  end
end
