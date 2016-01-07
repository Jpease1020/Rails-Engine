require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "/api/v1/transactions/:id/invoice#index returns the invoice associated with that transaction" do
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "1", result: "success")

    get :index, transaction_id: transaction.id, format: :json
    assert_response :success

    returned_invoice = JSON.parse(response.body)

    assert_equal returned_invoice["id"], invoice.id
  end
end
