class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index
    # respond_with Item.joins(:merchant).where("merchants.id= ?", params[:merchant_id])
    respond_with Item.where(merchant_id: params[:merchant_id])
  end
end
