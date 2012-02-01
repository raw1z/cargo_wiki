When /^I try to create a new article$/ do
  visit "/cargo/articles/new"
end

Then /^I should be redirected to the login page$/ do
  current_path.should == "/cargo/login"
end

Then /^I should see the flash error message "(.*)"$/ do |message|
  within('#flash-alert') do
    page.should have_content(message)
  end
end

When /^I try to edit this article$/ do
  visit "/cargo/articles/#{Cargo::Article.last.id}/edit"
end