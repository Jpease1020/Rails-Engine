class Api::V1::MerchantsController < ApplicationController

  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    rand_num = Merchant.count
    respond_with Merchant.find(rand(rand_num))
  end

  def most_revenue
    render text: "ji"
  end

  def revenue
    respond_with Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ?, "success").sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def customers_with_pending_invoices
    respond_with Customer.joins()
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
