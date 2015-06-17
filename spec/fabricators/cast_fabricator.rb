Fabricator(:cast) do
  user(fabricator: :user)
  title   { Faker::Name.name }
  content  { Faker::Internet.email }
  expiration { 10.days.from_now }
end