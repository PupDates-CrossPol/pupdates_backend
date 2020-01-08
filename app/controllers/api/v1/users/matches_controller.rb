class Api::V1::Users::MatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: UserSerializer.new(User.find_by(id: params[:user_id]).user_matches)
  end

  def create
    match = Match.new(match_params)
    if match.save
      render json: "Success!"
    else
      render json: "Match cannot be saved"
    end
  end

  private

  def match_params
    params.permit(:match_id, :status, :user_id)
  end
end
