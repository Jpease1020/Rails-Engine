class Api::V1::InvoiceItems::ItemController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.find_by(id: params[:invoice_item_id]).item
  end
end
