class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      current_user
      return render json: UserSerializer.new(User.find_by(id: current_user.id))
    else
      render json: "Invalid Email"
    end
  end
end
