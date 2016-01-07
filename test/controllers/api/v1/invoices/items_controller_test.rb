require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase

  test "/api/v1/invoices/:id/items#index returns the items associated with that invoice" do
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    item = Item.create(name: "thing", description: "description 1", merchant_id: 3, unit_price: 23.45)
    item2 = Item.create(name: "thing2", description: "description 2", merchant_id: 3, unit_price: 26.45)
    item3 = Item.create(name: "thing3", description: "description 3", merchant_id: 3, unit_price: 33.45)
    item4 = Item.create(name: "thing4", description: "description 4", merchant_id: 3, unit_price: 23.75)

    get :index, invoice_id: invoice.id, format: :json
    assert_response :success

    returned_items = JSON.parse(response.body)

    returned_items.each do |item|
      assert_equal item["invoice_id"], invoice.id
    end
  end
end
