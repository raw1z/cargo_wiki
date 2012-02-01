module CargoWiki
  class UsersController < ApplicationController
    before_filter :require_login, :require_admin

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to users_path, :notice => "Account created!"
      else
        render "new"
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to users_path, :notice => "Updated successfully!"
      else
        render "edit"
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, :notice => "successfully destroyed!"
    end
  end
end
