Fabricator(:user) do
  name   { Faker::Name.name }
  email  { Faker::Internet.email }
  default_zip {"36608"}
  password              "password1"
  password_confirmation "password1"
end
