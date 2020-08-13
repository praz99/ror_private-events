class UsersController < ApplicationController

  def new; end

  def create
    session[:username] = params[:username]
    redirect_to root_path
  end

  def show; end
end
