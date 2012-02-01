Before '@anonymous_visitor' do
  visit '/cargo/logout'
end

Before '@editor' do
  visit '/cargo/logout'
  @user = Factory.create(:user)
  visit '/cargo/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_on 'Login'
end

Before '@admin' do
  visit '/cargo/logout'
  @user = Factory.create(:user, :role => 'admin')
  visit '/cargo/login'
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => 'passwd'
  click_on 'Login'
end