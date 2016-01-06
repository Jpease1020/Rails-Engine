class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.where(merchant_id: params[:merchant_id])
  end
end
# Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ?", "success").sum("invoice_items.quantity * invoice_items.unit_price")
