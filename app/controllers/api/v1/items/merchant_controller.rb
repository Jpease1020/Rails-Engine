class Api::V1::Items::MerchantController < ApplicationController
  respond_to :json

  def index
    # respond_with Item.find_by(id: params[:item_id]).merchant
    respond_with Merchant.joins(:items).where("items.id = ?", params[:item_id]).first
  end
end
