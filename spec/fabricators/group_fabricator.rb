Fabricator(:group) do
  name   { Faker::Hacker.adjective+" "+Faker::Hacker.adjective+" "+Faker::Hacker.noun }
  description  { Faker::Lorem.words(4).join(" ") }
  picture { Faker::Avatar.image }
end