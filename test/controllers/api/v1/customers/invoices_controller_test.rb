require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "/api/v1/customers/:id/invoices#index returns the invoices associated with that customer" do
    customer = Customer.create(first_name: "this", last_name: "guy")
    invoice1 = Invoice.create(customer_id: customer.id, merchant_id: 2, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: 3, status: "shipped")
    invoice3 = Invoice.create(customer_id: customer.id, merchant_id: 4, status: "shipped")


    get :index, customer_id: customer.id, format: :json
    assert_response :success

    returned_invoices = JSON.parse(response.body)

    returned_invoices.each do |invoice|
      assert_equal invoice["customer_id"], customer.id
    end
  end
end
