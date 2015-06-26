Fabricator(:user) do
  name   { Faker::Name.name }
  email  { Faker::Internet.email }
  home_lat {Random.rand(30.06909396443887...48.77791275550184)}
  home_lon {Random.rand(-124.58358764648438...-81.53984069824219)}
  avatar { Faker::Avatar.image }
  password              "password1"
  password_confirmation "password1"
end
