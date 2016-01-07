require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase

  test "/api/v1/items/:id/invoice_item#index returns the invoice_items associated with that item" do
    item = Item.create(name: "thing", description: "description 1", merchant_id: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: 1, quantity: 3, unit_price: 23.45)
    invoice_item2 = InvoiceItem.create(item_id: item.id, invoice_id: 2, quantity: 3, unit_price: 26.45)
    invoice_item3 = InvoiceItem.create(item_id: item.id, invoice_id: 3, quantity: 3, unit_price: 33.45)
    invoice_item4 = InvoiceItem.create(item_id: item.id, invoice_id: 4, quantity: 3, unit_price: 23.75)

    get :index, item_id: item.id, format: :json
    assert_response :success

    returned_invoice_items = JSON.parse(response.body)

    returned_invoice_items.each do |invoice_item|
      assert_equal invoice_item["item_id"], item.id
    end
  end
end
