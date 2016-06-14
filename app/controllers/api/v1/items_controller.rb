class Api::V1::ItemsController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session, only: [:destroy]

  def index
    respond_with Item.all
  end

end
