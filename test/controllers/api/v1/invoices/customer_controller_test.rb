require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase

  test "/api/v1/invoices/:id/customer#index returns the customer associated with that invoice" do
    customer = Customer.create(first_name: "Jeff", last_name: "Smith")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: 2, status: "shipped")

    get :index, invoice_id: invoice.id, format: :json
    assert_response :success

    returned_customer = JSON.parse(response.body)

    assert_equal returned_customer["id"], customer.id
  end

end
