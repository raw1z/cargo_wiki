# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => 'Cargo::User' do
    username { "#{Faker::Name.first_name}.#{Faker::Name.last_name}".downcase }
    role "editor"
    password "passwd"
    password_confirmation { |u| u.password }
  end
end
