class Version < ActiveRecord::Base
  attr_accessible :commit_message

  def created_by
    CargoWiki::User.find(self.whodunnit)
  end

  def article
    self.next.try(:reify) || self.item
  end
end