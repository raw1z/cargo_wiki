module Cargo
  class VersionsController < ApplicationController
    def index
      if params[:article_id]
        @article = Article.find(params[:article_id])
        @versions = @article.versions.all.reverse
      else
        @versions = Version.order('created_at DESC')
      end
    end
  end
end
