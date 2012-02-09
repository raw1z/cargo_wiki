Given /^I visit its show page$/ do
  @article = CargoWiki::Article.last
  visit "/cargo_wiki/articles/#{@article.id}"
end

Given /^I click on 'Edit'$/ do
  within('.toolbar') do
    click_link 'Edit'
  end
end

Given /^I change the (.*) to '(.*)'$/ do |attribute, value|
  @new_value = value
  fill_in "article_#{attribute}", :with => value
end

Given /^I write a valid commit message$/ do
  fill_in 'article_last_commit_message', :with => Faker::Lorem.sentence
end

When /^I click on 'Update'$/ do
  click_button 'Update'
end

Then /^I should see the new (.*)$/ do |attribute|
  page.should have_content(@new_value)
end

Then /^I should stay on the edit article page$/ do
  current_path.should == "/cargo_wiki/articles/#{@article.id}"
  page.should have_css('#article_title')
  page.should have_css('#article_body')
  page.should have_css('#article_last_commit_message')
end

Then /^I should see the article with an empty string$/ do
  page.should_not have_css('.article .body')
end

Then /^I should see the error message "(.*)"$/ do |message|
  within(".error") do
    page.should have_content(message)
  end
end

Given /^I do not write the commit message$/ do
end
