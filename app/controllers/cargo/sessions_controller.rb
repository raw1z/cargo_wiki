module Cargo
  class SessionsController < ApplicationController
    def new
      if signed_in?
        redirect_to root_url, :alert => "You're already logged in"
      end
    end

    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        params[:remember_me] ? cookies.permanent[:auth_token] = user.auth_token : cookies[:auth_token] = user.auth_token  
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid username or password"
        render "new"
      end
    end

    def destroy
      cookies.delete(:auth_token)
      redirect_to root_url, :notice => "Logged out!"
    end
  end
end
