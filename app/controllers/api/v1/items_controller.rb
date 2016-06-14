class Api::V1::ItemsController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session, only: [:destroy]

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with Item.find(params[:id]).destroy
  end

end
