require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "merchants/:id/items#index returns a collection of items associated with that merchant" do
    merchant = Merchant.create(name: "A Store")
    merchant.items.create(name: "Item 1", description: "this is an item", unit_price: 12.89, merchant_id: 1)

    get :index, merchant_id: merchant.id, format: :json
    assert_response :success

    items = JSON.parse(response.body)
    
    items.first(5).each do |item|
      assert_equal item["merchant_id"], merchant.id
    end
  end
end
