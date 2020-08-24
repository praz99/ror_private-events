class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Private Events!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_events = @user.created_events

    @current_user = current_user
    @previous_event = @current_user.created_events.previous_event
    @upcoming_event = @current_user.created_events.upcoming_event
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
