Fabricator(:group) do
  name   { Faker::Name.name }
  description  { "Fake description for group" }
end