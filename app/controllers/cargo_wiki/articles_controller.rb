module CargoWiki
  class ArticlesController < ApplicationController
    before_filter :require_login, :except => [:index, :show]
    before_filter :require_admin, :only => [:destroy, :publish]

    def index
      if params[:tag_id]
        @tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
        @articles = Article.published.tagged_with(@tag.name).order('updated_at DESC')
        @unpublished_articles = Article.unpublished.tagged_with(@tag.name).order('updated_at DESC')
      else
        @articles = Article.published.order('updated_at DESC')
        @unpublished_articles = Article.unpublished
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
      end
    end

    def show
      @article = Article.published.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @article }
      end
    end

    def new
      @article = current_user.articles.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end

    def edit
      @article = Article.published.find(params[:id])
    end

    def create
      @article = current_user.articles.published.new(params[:article])

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render json: @article, status: :created, location: @article }
        else
          format.html { render action: "new" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @article = Article.published.find(params[:id])

      respond_to do |format|
        if @article.update_attributes(params[:article])
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @article = Article.published.find(params[:id])
      @article.published = false
      @article.last_commit_message = "unpublished article"
      @article.save!

      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    end

    def publish
      @article = Article.unpublished.find(params[:id])
      @article.published = true
      @article.last_commit_message = "published article"
      @article.save!

      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    end

    def preview
      @body = params[:body]
    end
  end
end
