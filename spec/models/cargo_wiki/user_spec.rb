require 'spec_helper'

describe CargoWiki::User do
  it "validates the presence of the username" do
    user = FactoryGirl.build(:user, :username => "")
    user.save.should == false
    user.errors.messages[:username].should include("can't be blank")

    user = FactoryGirl.create(:user)
    user.username = ""
    user.save.should == false
    user.errors.messages[:username].should include("can't be blank")
  end

  it "validates the presence of the role" do
    user = FactoryGirl.build(:user, :role => "")
    user.save.should == false
    user.errors.messages[:role].should include("can't be blank")

    user = FactoryGirl.create(:user)
    user.role = ""
    user.save.should == false
    user.errors.messages[:role].should include("can't be blank")
  end

  it "validates the presence of the password" do
    user = FactoryGirl.build(:user, :password => "")
    user.save.should == false
    user.errors.messages[:password].should include("can't be blank")
  end

  it "validates the presence of the password confirmation" do
    user = FactoryGirl.build(:user, :password_confirmation => "")
    user.save.should == false
    user.errors.messages[:password].should include("doesn't match confirmation")
  end
end
