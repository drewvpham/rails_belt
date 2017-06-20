class UsersController < ApplicationController
  before_action :user_authorized, only: [:show]
  before_action :user_logged_in, only: [:new]
  def index
  end

  def create
    @user= User.create(user_params)
    if @user.valid?
      session[:user_id]=@user.id

      redirect_to ideas_path

    else
      flash[:errors]= @user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @user=User.find(session[:user_id])
  end

  def update
    @user=User.find(session[:user_id])
    @user.update(user_params)
    redirect_to ideas_path
  end

  def show
    @user=User.find(params[:id])
    @ideas_count=@user.ideas.count

  end

  private
    def user_params
      params.require(:user).permit(:first_name, :alias, :last_name, :email, :password, :password_confirmation)
    end
end
