class Api::V1::Merchants::InvoicesController < ApplicationController
  respond_to :json

  def index
    render text: "these are the right merchant invoices"
    # respond_with Invoice.where(merchant_id: params[:merchant_id])
  end
end
