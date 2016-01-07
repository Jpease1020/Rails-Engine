require 'test_helper'

class Api::V1::InvoiceItems::ItemControllerTest < ActionController::TestCase
  test "/api/v1/invoice_items/:id/item#index returns the item associated with that invoice item" do
    item = Item.create(name: "Item 1", description: "Item 1 desc", merchant_id: 3, unit_price: 34.45)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: 2, quantity: 3, unit_price: 34.45)

    get :index, invoice_item_id: invoice_item.id, format: :json
    assert_response :success

    returned_item = JSON.parse(response.body)

    assert_equal returned_item["id"], item.id
  end
end
