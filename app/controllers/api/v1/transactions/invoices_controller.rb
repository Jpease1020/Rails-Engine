class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(transaction_id: params[:transaction_id])
  end
end
