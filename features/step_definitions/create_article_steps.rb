Given /^I click on 'New Article'$/ do
  within('.toolbar') do
    click_link 'New Article'
  end
end

Given /^I fill the new article form with valid data$/ do
  fill_in 'article_title', :with => Faker::Lorem.sentence
  fill_in 'article_body', :with => Faker::Lorem.paragraphs.join(" ")
  fill_in 'article_last_commit_message', :with => "Initial commit"
end

When /^I click on 'Create'$/ do
  click_button 'Create'
end

Then /^I should be redirected to the new article show page$/ do
  @article = Cargo::Article.last
  current_path.should == "/cargo/articles/#{@article.id}"
end

Then /^I should see the newly created article$/ do
  within(".article") do
    within(".title") { page.should have_content(@article.title) }
    within(".body") { page.should have_content(@article.body) }
  end
end

Then /^I should see only the title of newly created article$/ do
  within(".article") do
    within(".title") { page.should have_content(@article.title) }
    page.should_not have_css('.body')
  end
end

Given /^I fill the new article form with valid data except the title$/ do
  fill_in 'article_title', :with => ""
  fill_in 'article_body', :with => Faker::Lorem.paragraphs.join(" ")
  fill_in 'article_last_commit_message', :with => "Initial commit"
end

Given /^I fill the new article form with valid data except the body$/ do
  fill_in 'article_title', :with => Faker::Lorem.sentence
  fill_in 'article_body', :with => ""
  fill_in 'article_last_commit_message', :with => "Initial commit"
end

Given /^I fill the new article form with valid data except the commit message$/ do
  fill_in 'article_title', :with => Faker::Lorem.sentence
  fill_in 'article_body', :with => Faker::Lorem.paragraphs.join(" ")
  fill_in 'article_last_commit_message', :with => ""
end

Then /^I should stay on the new article page$/ do
  current_path.should == "/cargo/articles"
  page.should have_css('#article_title')
  page.should have_css('#article_body')
  page.should have_css('#article_last_commit_message')
end