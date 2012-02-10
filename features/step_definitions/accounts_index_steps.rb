When /^I visit the accounts index page$/ do
  visit '/cargo_wiki/users'
end

Then /^I should see the accounts list$/ do
  within('.users') do
    CargoWiki::User.all.each do |user|
      within("#user-#{user.id}") do
        page.should have_content(user.username)
        page.should have_content(user.role)
      end
    end
  end
end

Then /^I should be able edit\/destroy the existing accounts$/ do
  CargoWiki::User.all.each do |user|
    within("#user-#{user.id}") do
      page.should have_selector('a', :text => 'Edit')
      page.should have_selector('a', :text => 'Destroy')
    end
  end
end

Then /^I should be able to create a new account$/ do
  within(".toolbar") do
    page.should have_selector('a', :text => 'New Account')
  end
end