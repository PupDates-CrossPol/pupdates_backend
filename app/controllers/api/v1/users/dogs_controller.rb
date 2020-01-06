class Api::V1::Users::DogsController < ApplicationController
  def index
    render json: DogSerializer.new(User.find(params[:user_id]).dogs)
  end
end
