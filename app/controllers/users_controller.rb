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
      redirect_to @user, success: 'Профиль успешно создан'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: 'Профиль успешно обновлен'# Handle a successful update.
    else
      render 'edit'
    end
  end
  private
 
  def user_params
    params.require(:user).permit(:id, :email, :avatar, :name)
  end
 
  def set_user
    @user = User.find(params[:id])
  end
end
