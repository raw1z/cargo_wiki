# Read about factories at http://github.com/thoughtbot/factory_girl

tags = Faker::Lorem.words(60)

FactoryGirl.define do
  factory :article, :class => 'CargoWiki::Article' do
    sequence(:title) { |n| "Article #{n}" }
    body { Faker::Lorem.paragraphs.join(" ") }
    last_commit_message { Faker::Lorem.sentence }
    tag_list { tags.sample((2..4).to_a.sample).join(', ') + ', hum' }
    association :author, :factory => :user
  end
end
