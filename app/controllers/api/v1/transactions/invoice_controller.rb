class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.find_by(id: params[:transaction_id]).invoice
    # change over to invoice.transaction
  end
end
