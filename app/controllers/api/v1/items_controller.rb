class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by(item_params)
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    rand_num = Item.count
    respond_with Item.find(rand(rand_num))
  end

  def most_revenue
    respond_with Item.top_items_by_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.top_items_by_number_sold(params[:quantity])
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
