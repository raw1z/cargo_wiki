module CargoWiki
  class TagsController < ApplicationController
    respond_to :html, :json

    def index
      @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:q]}%").order('name ASC')
      respond_with(@tags)
    end
  end
end
