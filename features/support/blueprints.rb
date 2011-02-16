require 'machinist/active_record'

User.blueprint do
  email { Faker::Email }
end