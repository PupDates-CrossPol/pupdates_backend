class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def update
    user = User.find(params[:id])
    if current_user
      user.update(image: "#{params[:image]}&token=#{params[:token]}")
      user.reload
      render json: UserSerializer.new(User.find(params[:id]))
    else
      render json: "Image cannot be updated"
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :image)
  end
end
