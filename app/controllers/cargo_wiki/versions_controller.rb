module CargoWiki
  class VersionsController < ApplicationController
    def index
      if params[:article_id]
        @article = Article.find(params[:article_id])
        @versions = @article.versions.all.reverse
      else
        @versions = Version.order('created_at DESC')
      end
    end

    def show
      @article = Article.find(params[:article_id])
      @version = @article.versions.find(params[:id])

      @version_article = @version.next.try(:reify)
      @version_article = @article if @version_article.nil?
      @version_article.title = "[#{@version.index}] #{@version_article.title}"
    end
  end
end
