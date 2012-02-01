module Cargo
  class TagsController < ApplicationController
    respond_to :html, :json

    def index
      @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:q]}%")
      respond_with(@tags)
    end
  end
end
