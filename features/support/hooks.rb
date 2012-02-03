Before '@anonymous_visitor' do
  visit '/cargo_wiki/logout'
  within('#session') do
    page.should have_content("Login")
  end
end

Before '@editor' do
  visit '/cargo_wiki/logout'
  within('#session') do
    page.should have_content("Login")
  end

  @user = Factory.create(:user)
  visit '/cargo_wiki/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_button 'Login'

  within('#session') do
    page.should have_content("Logout")
  end
end

Before '@admin' do
  visit '/cargo_wiki/logout'
  within('#session') do
    page.should have_content("Login")
  end

  @user = Factory.create(:user, :role => 'admin')
  visit '/cargo_wiki/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_button 'Login'

  within('#session') do
    page.should have_content("Logout")
  end
end