class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def update
    user = User.find(params[:id])
    if current_user
      user.update(image: "#{params[:image]}&cs=#{params[:cs]}&dpr=#{params[:dpr]}&h=#{params[:h]}&w=#{params[:w]}")
    else
      render json: "Image cannot be updated"
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :image)
  end
end
