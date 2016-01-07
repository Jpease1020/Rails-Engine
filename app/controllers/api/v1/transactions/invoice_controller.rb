class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.find_by(id: params[:transaction_id]).invoice
    #this is the only one I want to change over to Invoice model search
  end
end
