
require "http"
require "fabrication"

avatar_paths = [Rails.root+'db/seed_images/beck.jpg',Rails.root+'db/seed_images/grunt_logo.png',Rails.root+'db/seed_images/JavaScript-logo.png',
                Rails.root+'db/seed_images/Microsoft_SQL_Server_Logo.png',Rails.root+'db/seed_images/RSS.png',
                Rails.root+'db/seed_images/Ruby_logo.png',Rails.root+'db/seed_images/Ruby_on_Rails.png',Rails.root+'db/seed_images/Yard.jpg']
group_picture_paths = [Rails.root+'db/seed_images/beer.jpg',Rails.root+'db/seed_images/bookworm.jpg',
                Rails.root+'db/seed_images/coffee.jpg',Rails.root+'db/seed_images/Frisbee.jpg',
                Rails.root+'db/seed_images/guitar.jpg',Rails.root+'db/seed_images/kayak.jpg',
                Rails.root+'db/seed_images/mountain.jpg',Rails.root+'db/seed_images/recordcollection.jpg',
                Rails.root+'db/seed_images/stars.jpeg']
eventbrite_picture_path = Rails.root+'db/seed_images/eventbrite.png'

# USERS
users = []
20.times do |n|
    user = Fabricate(:user, avatar: File.open(avatar_paths.sample(1)[0]))
    users << user
end

# GROUPS
groups = []
15.times do |n|
    group = Fabricate(:group, picture: File.open(group_picture_paths.sample(1)[0]))
    groups << group
end

# SUBSCRIPTIONS
subscriptions = []
users.each do |user|
    10.times do |n|
        subscription = Fabricate(:subscription, user: user, group: groups.sample(1)[0])
        subscriptions << subscription
    end
end

# CASTS
casts = []
users.each do |user|
    5.times do
        cast = Fabricate(:cast, user: user)
        casts << cast
    end
end

# CAST GROUPS
castgroups = []
casts.each do |cast|
    3.times do
        castgroup = Fabricate(:castgroup, group: groups.sample(1)[0], cast: cast)
        castgroups << castgroup
    end
end

# COMMENTS
comments = []
casts.each do |cast|
    4.times do
        comment = Fabricate(:comment, cast: cast, user: users.sample(1)[0])
        comments << comment
    end
end

# EVENTBRITE SEEDS
eventbrite_casts = []
eventbrite_url = "https://www.eventbriteapi.com/v3/events/search/?popular=true&location.latitude=36.162664&location.longitude=-86.781602&expand=venue&token=#{ENV['EVENTBRITE_KEY']}"
eventbrite_user = Fabricate(:user, name: 'Eventbrite', email: 'info@eventbrite.com', avatar: File.open(eventbrite_picture_path))
eventbrite_group = Fabricate(:group, name: 'Eventbrite', description: 'Eventbrite Events', picture: File.open(eventbrite_picture_path))
eventbrite_response = JSON.parse(HTTP[:accept => "application/json"].get(eventbrite_url).to_s)
eventbrite_response.fetch("events").each do |event|
  if event["venue"] && event["venue"]["address"]
    eventbrite_cast = Fabricate(:cast, user: eventbrite_user, title: event["name"]["text"], content: event["description"]["text"],
                    expiration: DateTime.strptime(event["end"]["local"].to_s+'-0600').to_s, time_offset: -6,
                    lat: event["venue"]["address"]["latitude"], lon: event["venue"]["address"]["longitude"])
    castgroup = Fabricate(:castgroup, group: eventbrite_group, cast: eventbrite_cast)
    eventbrite_casts << eventbrite_cast
  end
end
