require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "/api/v1/customers/:id/transactions#index returns the transactions associated with that customer" do
    customer = Customer.create(first_name: "this", last_name: "guy")
    invoice  = Invoice.create(customer_id: customer.id, merchant_id: 1, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: 1, status: "shipped")
    transaction  = Transaction.create(invoice_id: invoice.id, credit_card_number: "1", result: "failed")
    transaction2 = Transaction.create(invoice_id: invoice.id, credit_card_number: "1", result: "success")
    transaction3 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "1", result: "failed")
    transaction4 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "1", result: "success")

    get :index, customer_id: customer.id, format: :json
    assert_response :success

    returned_transactions = JSON.parse(response.body)
    customers_invoices_ids = customer.invoices.pluck(:id)

    returned_transactions.each do |transaction|
      customers_invoices_ids.include?(transaction['id'])
    end
  end
end
