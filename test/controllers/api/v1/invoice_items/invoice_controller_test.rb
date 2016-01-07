require 'test_helper'

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "/api/v1/invoice_items/:id/invoice#index returns the invoice associated invoice with that invoice item" do
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: invoice.id, quantity: 3, unit_price: 34.45)

    get :index, invoice_item_id: invoice_item.id, format: :json
    assert_response :success

    returned_invoice = JSON.parse(response.body)

    assert_equal returned_invoice["id"], invoice.id
  end
end
