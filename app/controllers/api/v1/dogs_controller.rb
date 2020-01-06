class Api::V1::DogsController < ApplicationController
  def index
    render json: DogSerializer.new(Dog.all)
  end
end
