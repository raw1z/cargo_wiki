Given /^I edit this user account$/ do
  @user = CargoWiki::User.last
  within("#user-#{@user.id}") do
    click_link 'Edit'
  end
end

Given /^I change the username to "(.*)"$/ do |new_value|
  @new_username = new_value
  fill_in 'Username', :with => @new_username
end

Given /^I set the password to "(.*)"$/ do |new_password|
  @new_password = new_password
  fill_in 'Password', :with => @new_password
end

Then /^I shoud stay on the account edit page$/ do
  within("form") do
    page.should have_selector('#user_username')
    page.should have_selector('#user_role')
    page.should have_selector('#user_password')
    page.should have_selector('#user_password_confirmation')
  end
end

Then /^The password of the user should have been changed$/ do
  @user.reload.valid_password?(@new_password).should == true
end

Given /^I set the password confirmation to "(.*)"$/ do |password_confirmation|
  fill_in 'Password confirmation', :with => password_confirmation
end

Then /^The password of the user should have not been changed$/ do
  @user.reload.valid_password?(@new_password).should == false
end

Given /^I change the role to "(.*)"$/ do |arg1|
  select "admin", :from => 'Role'
end