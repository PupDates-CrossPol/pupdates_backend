class Api::V1::SessionsController < ApplicationController
  def new
    binding.pry
    # if current_user
    #   render json: "Logged in as #{@user.first_name} #{@user.last_name}."
    # end
  end

  def create
    @user = User.find_by(email: "#{params[:email]}.#{params[:format]}")
    if user
      session[:user_id] = user.id
      current_user
      get login_path
    else
      render json: "Invalid Email"
    end
  end
end
