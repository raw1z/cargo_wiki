# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article, :class => 'CargoWiki::Article' do
    sequence(:title) { |n| "Article #{n}" }
    body { Faker::Lorem.paragraphs.join(" ") }
    last_commit_message { Faker::Lorem.sentence }
    association :author, :factory => :user
  end
end
