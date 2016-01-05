class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_by(id: params[:invoice_id]).customer
  end
end
