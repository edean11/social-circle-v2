
Fabricator(:cast) do
  user(fabricator: :user)
  title   { Faker::Lorem.words(2).join(" ") }
  content  { Faker::Lorem.words(4).join(" ") }
  day_num = Random.rand(0.005...60).to_i
  future_date = (day_num).days.from_now.to_s
  expiration { DateTime.strptime(((Random.rand(2...90).to_i).days.from_now.to_s), '%Y-%m-%d %H:%M:%S %z').to_s }
  lat {Random.rand(30.06909396443887...48.77791275550184)}
  lon {Random.rand(-124.58358764648438...-81.53984069824219)}
  time_offset {Random.rand(-12...14)}
end