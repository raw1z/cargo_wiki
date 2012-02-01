class Version < ActiveRecord::Base
  attr_accessible :commit_message

  def created_by
    Cargo::User.find(self.whodunnit)
  end
end