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

  def revenue
    if params[:date]
      respond_with Merchant.revenue_by_date(params[:id], params[:date])
    else
      respond_with Merchant.revenue(params[:id])
    end
  end

  def most_revenue
    respond_with Merchant.top_merchants_by_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.top_merchants_by_number_sold(params[:quantity])
  end

  def all_merchants_revenue_by_date
    respond_with Merchant.all_merchants_revenue_by_date(params[:date])
  end

  def customers_with_pending_invoices
    respond_with Customer.customers_with_pending_invoices(params[:id])
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
