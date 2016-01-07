require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase

  test "/api/v1/invoices/:id/transactions#index returns the transactions associated with that invoice" do
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "1", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice.id, credit_card_number: "2", result: "success")
    transaction3 = Transaction.create(invoice_id: invoice.id, credit_card_number: "3", result: "success")
    transaction4 = Transaction.create(invoice_id: invoice.id, credit_card_number: "4", result: "success")

    get :index, invoice_id: invoice.id, format: :json
    assert_response :success

    returned_transactions = JSON.parse(response.body)

    returned_transactions.each do |transaction|
      assert_equal transaction["invoice_id"], invoice.id
    end
  end
end
