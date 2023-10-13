class UsersController < ApplicationController
  skip_before_action :require_login!, only: :create

  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
    p "INgreso a show"
    render json: current_user
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :phone, :role)
  end

end