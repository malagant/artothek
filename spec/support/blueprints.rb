require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet::email }
end

Artist.blueprint do
  tracks(3)
end

Album.blueprint do
  title
  artist { Artist.make!(:artist_name => Faker::Name.name) }
end

Track.blueprint do
  title
  duration
end