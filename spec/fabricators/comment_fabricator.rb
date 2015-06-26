Fabricator(:comment) do
  user(fabricator: :user)
  cast(fabricator: :cast)
  content  { Faker::Lorem.words(5).join(" ") }
end