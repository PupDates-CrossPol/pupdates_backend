class WelcomeController < ApplicationController
  def index
    render json: "Only the goodest doggos beyond this point"
  end
end
