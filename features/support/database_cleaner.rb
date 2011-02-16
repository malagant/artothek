if defined?(ActiveRecord::Base)
  begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  DatabaseCleaner.strategy = :truncation
  rescue LoadError => ignore_if_database_cleaner_not_present
    puts ignore_if_database_cleaner_not_present
  end
end

Before do
  DatabaseCleaner.clean!
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
