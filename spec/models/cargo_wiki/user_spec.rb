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
end
