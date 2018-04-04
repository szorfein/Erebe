class HomeController < ApplicationController
  def index
      render json: { message: 'Hello !' }
  end
end
