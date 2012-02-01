Before '@anonymous_visitor' do
  visit '/cargo_wiki/logout'
end

Before '@editor' do
  visit '/cargo_wiki/logout'
  @user = Factory.create(:user)
  visit '/cargo_wiki/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_on 'Login'
end

Before '@admin' do
  visit '/cargo_wiki/logout'
  @user = Factory.create(:user, :role => 'admin')
  visit '/cargo_wiki/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_on 'Login'
end