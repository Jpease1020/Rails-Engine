class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_by(transaction_id: params[:transaction_id])
    respond_with Transaction.find_by(params[:transaction_id]).invoice
    respond_with Invoice.joins(:transactions).where
  end
end
