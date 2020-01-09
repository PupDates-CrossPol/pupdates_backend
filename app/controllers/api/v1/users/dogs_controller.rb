class Api::V1::Users::DogsController < ApplicationController
  def index
    render json: DogSerializer.new(User.find(params[:user_id]).dogs)
  end

  def create
    dog = Dog.find_or_create_by(dog_params)
    if dog.save
      render json: DogSerializer.new(User.find(params[:user_id]).dogs)
    else
      render json: "Doggo cannot be saved"
    end
  end

  private

  def dog_params
    params.permit(:name, :sex, :breed, :size, :age, :fixed, :vaccinated, :good_with_kids, :user_id)
  end
end
