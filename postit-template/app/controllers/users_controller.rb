class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created successfully"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show
    @user = current_user
    
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User has been updated successfully"
      redirect_to edit_user_path
    else
      render 'edit'
    end

  end

  def edit
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)

  end
end