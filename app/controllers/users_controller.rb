class UsersController < ApplicationController
  before_action :set_user, only: [:show, :download]
 
  def index
    @users = User.order('created_at DESC')
  end
 
  def new
    @user = User.new
  end
 
  def show
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render :new
    end
  end
  
  def edit

  end
  private
 
  def user_params
    params.require(:user).permit(:id, :email, :image, :name)
  end
 
  def set_user
    @user = User.find(params[:id])
  end
end
