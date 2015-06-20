Fabricator(:comment) do
  user(fabricator: :user)
  cast(fabricator: :cast)
  content  { Faker::Internet.email }
end