require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet::email }
end

Track.blueprint do
  album
  title { "Track #{1+rand(40)}"}
  duration { 1 + rand(1000) }
end

Artist.blueprint do
  artist_name { Faker::Name.name }
end

Album.blueprint do
  user { User.make!( :password => "123456") }
  artist
  title { Faker::Lorem.words 3 }
end

