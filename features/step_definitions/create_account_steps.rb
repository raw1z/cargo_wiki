Given /^I am on the accounts index page$/ do
  visit '/cargo_wiki/users'
end

Given /^I click on 'New Account'$/ do
  click_link 'New Account'
end

Given /^I fill the new account form with valid data$/ do
  fill_in "Username", :with => "john.doe"
  select "editor", :from => "Role"
  fill_in "Password", :with => "passwd"
  fill_in "Password confirmation", :with => "passwd"
end

Then /^I should be redirected to the accounts index page$/ do
  current_path.should == "/cargo_wiki/users"
  page.should have_selector('.users')
end

Then /^I should see the newly created account$/ do
  @user = CargoWiki::User.last
  within('.users') do
    within("#user-#{@user.id}") do
      page.should have_content(@user.username)
      page.should have_content(@user.role)
    end
  end
end

Given /^I fill the new account form with valid data except username$/ do
  select "editor", :from => "Role"
  fill_in "Password", :with => "passwd"
  fill_in "Password confirmation", :with => "passwd"
end

Then /^I should stay on the new account page$/ do
  current_path.should == "/cargo_wiki/users"
  page.should have_selector('#user_username')
  page.should have_selector('#user_role')
  page.should have_selector('#user_password')
  page.should have_selector('#user_password_confirmation')
end

Given /^I fill the new account form with valid data except role$/ do
  fill_in "Username", :with => "john.doe"
  fill_in "Password", :with => "passwd"
  fill_in "Password confirmation", :with => "passwd"
end

Given /^I fill the new account form with valid data except password$/ do
  fill_in "Username", :with => "john.doe"
  select "editor", :from => "Role"
  fill_in "Password confirmation", :with => "passwd"
end

Given /^I fill the new account form with valid data except password confirmation$/ do
  fill_in "Username", :with => "john.doe"
  select "editor", :from => "Role"
  fill_in "Password", :with => "passwd"
end