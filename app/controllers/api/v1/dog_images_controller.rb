class Api::V1::DogImagesController < ApplicationController
  def index
    render json: DogImageSerializer.new(DogImage.all)
  end

  def show
    render json: DogImageSerializer.new(DogImage.find(params[:id]))
  end
end
