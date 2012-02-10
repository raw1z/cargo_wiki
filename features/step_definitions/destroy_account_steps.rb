Given /^I see the two accounts$/ do
  within('.users') do
    CargoWiki::User.all.each do |user|
      within("#user-#{user.id}") do
        page.should have_content(user.username)
        page.should have_content(user.role)
      end
    end
  end
end

When /^I delete one of them$/ do
  @user_id = CargoWiki::User.last.id
  within("#user-#{@user_id}") { click_link 'Destroy' }
end

Then /^I should see the remaining account$/ do
  user = CargoWiki::User.last
  within('.users') do
    within("#user-#{user.id}") do
      page.should have_content(user.username)
      page.should have_content(user.role)
    end
  end
end

Then /^the deleted account should not exist anymore$/ do
  CargoWiki::User.count.should == 2
  CargoWiki::User.where(:id => @user_id).first.should be_nil
end