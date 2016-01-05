class Api::V1::Customers::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoices.where(customer_id: params[:customer_id])
  end
end
