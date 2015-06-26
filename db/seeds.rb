
avatar_paths = [Rails.root+'db/seed_images/beck.jpg',Rails.root+'db/seed_images/grunt_logo.png',Rails.root+'db/seed_images/JavaScript-logo.png',
                Rails.root+'db/seed_images/jquery-logo.jpg', Rails.root+'db/seed_images/Microsoft_SQL_Server_Logo.png',
                Rails.root+'db/seed_images/nodejs-green.png',Rails.root+'db/seed_images/recordcollection.jpg',Rails.root+'db/seed_images/RSS.png',
                Rails.root+'db/seed_images/Ruby_logo.png',Rails.root+'db/seed_images/Ruby_on_Rails.png',Rails.root+'db/seed_images/SQLite.png',
                Rails.root+'db/seed_images/stars.jpeg',Rails.root+'db/seed_images/Yard.jpg']

# USERS
users = []
20.times do |n|
    user = Fabricate(:user, avatar: File.open(avatar_paths.sample(1)[0]))
    users << user
end

# GROUPS
groups = []
30.times do |n|
    group = Fabricate(:group, picture: File.open(avatar_paths.sample(1)[0]))
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
