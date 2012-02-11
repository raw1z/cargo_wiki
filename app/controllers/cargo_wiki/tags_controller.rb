module CargoWiki
  class TagsController < ApplicationController
    respond_to :html, :json

    def index
      @tags = CargoWiki::Article.tag_counts_on(:tags).order("name ASC")
      respond_with(@tags)
    end
  end
end
