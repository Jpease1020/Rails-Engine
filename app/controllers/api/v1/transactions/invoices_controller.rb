class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json

  def index
    #  byebug
    respond_with Transaction.find_by(id: params[:transaction_id]).invoice
    # respond_with Invoice.joins(:transactions).where
  end
end
