module Cargo
  class Article < ActiveRecord::Base
    attr_accessor :last_commit_message

    attr_accessible :title, :body, :last_commit_message
    has_paper_trail :meta => { :commit_message => :last_commit_message }

    belongs_to :author, :class_name => 'User'
    validates_presence_of :title, :body, :last_commit_message
    
    def last_update_by
      User.find(self.versions.last.whodunnit)
    end
  end
end
