Fabricator(:user) do
  name   { Faker::Name.name }
  email  { Faker::Internet.email }
  password              "password1"
  password_confirmation "password1"
end
