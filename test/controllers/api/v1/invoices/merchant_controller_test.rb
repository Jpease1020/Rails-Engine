require 'test_helper'

class Api::V1::Invoices::MerchantControllerTest < ActionController::TestCase

  test "/api/v1/invoices/:id/merchants#index returns the merchant associated with that invoice" do
    merchant = Merchant.create(name: "store")
    invoice = Invoice.create(customer_id: 1, merchant_id: merchant.id, status: "shipped")

    get :index, invoice_id: invoice.id, format: :json
    assert_response :success

    returned_merchant = JSON.parse(response.body)
    assert_equal returned_merchant["id"], merchant.id
  end
end
