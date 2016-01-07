require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase

  test "/api/v1/items/:id/merchant#index returns the merchant associated with that item" do
    merchant = Merchant.create(name: "store")
    item = Item.create(name: "thing", description: "description 1", merchant_id: merchant.id, unit_price: 23.45)


    get :index, item_id: item.id, format: :json
    assert_response :success

    returned_merchant = JSON.parse(response.body)
    assert_equal returned_merchant["id"], merchant.id
  end
end
