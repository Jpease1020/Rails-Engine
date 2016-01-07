require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase

  test "/api/v1/invoices/:id/invoice_item#index returns the invoice_items associated with that invoice" do
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: invoice.id, quantity: 3, unit_price: 23.45)
    invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: invoice.id, quantity: 3, unit_price: 26.45)
    invoice_item3 = InvoiceItem.create(item_id: 3, invoice_id: invoice.id, quantity: 3, unit_price: 33.45)
    invoice_item4 = InvoiceItem.create(item_id: 4, invoice_id: invoice.id, quantity: 3, unit_price: 23.75)

    get :index, invoice_id: invoice.id, format: :json
    assert_response :success

    returned_invoice_items = JSON.parse(response.body)

    returned_invoice_items.each do |invoice_item|
      assert_equal invoice_item["invoice_id"], invoice.id
    end
  end
end
