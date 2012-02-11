require 'ap'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
Dir[File.expand_path("../../../factories/*.rb", __FILE__)].each  {|f| require f }

DatabaseCleaner.clean

FactoryGirl.create(:user, :username => 'r.z', :password => 'pwd', :role => 'admin')

10.times do
  user = FactoryGirl.create(:user)
  (1..100).to_a.sample.times { FactoryGirl.create(:article, :author => user) }
end
