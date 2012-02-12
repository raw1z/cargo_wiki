require 'spec_helper'

describe CargoWiki::Article do
  it "validates the presence of the title" do
    @article = FactoryGirl.build(:article, :title => "")
    @article.save.should == false
    @article.errors.messages[:title].should include("can't be blank")
  end
end
