module Cargo
  class Article < ActiveRecord::Base
    attr_accessor :last_commit_message

    attr_accessible :title, :body, :last_commit_message
    has_paper_trail :meta => { :commit_message => :last_commit_message }

    belongs_to :author, :class_name => 'User'
    validates_presence_of :title, :last_commit_message

    def last_update_by
      whodunnit = self.versions.last.whodunnit
      whodunnit.nil? ? self.author : User.find(whodunnit)
    end
  end
end
