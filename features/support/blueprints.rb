require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet::email }
end

Artist.blueprint do

end

Album.blueprint do
  title
end