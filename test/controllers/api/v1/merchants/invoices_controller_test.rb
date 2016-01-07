require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase

  test "merchants/:id/invoices#index returns a collection of invoices associated with that merchant" do
    merchant = Merchant.create(name: "A Store")
    merchant.invoices.create(customer_id: 1, merchant_id: merchant.id, status: "shipped")

    get :index, merchant_id: merchant.id, format: :json
    assert_response :success

    invoices = JSON.parse(response.body)

    invoices.each do |invoice|
      assert_equal invoice["merchant_id"], merchant.id
    end
  end

end
