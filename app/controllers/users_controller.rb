class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update ]

  def show; end

  def update
    if @user.update user_params 
      render :show
    else
      render json: { errors: @user.errors.messages }, status: 404
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :role, :status)
  end
end
