module CargoWiki
  class ArticlesController < ApplicationController
    before_filter :require_login, :except => [:index, :show]

    def index
      if params[:tag_id]
        @tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
        @articles = CargoWiki::Article.tagged_with(@tag.name).order('created_at ASC')
      else
        @articles = Article.scoped
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
      end
    end

    def show
      @article = Article.find(params[:id])

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
      @article = Article.find(params[:id])
    end

    def create
      @article = current_user.articles.new(params[:article])

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
      @article = Article.find(params[:id])

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
      @article = Article.find(params[:id])
      @article.destroy

      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    end
  end
end
