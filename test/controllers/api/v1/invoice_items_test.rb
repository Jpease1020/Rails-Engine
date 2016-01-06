require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of invoice_items" do
    get :index, format: :json
    assert_equal InvoiceItem.count, json_response.count
  end

  test "#index conatins invoice_items that have the correct properties" do
    get :index, format: :json

    json_response.each do |invoice_item|
      assert invoice_item["item_id"]
      assert invoice_item["invoice_id"]
      assert invoice_item["quantity"]
      assert invoice_item["unit_price"]
    end
  end

  test "show responds to JSON" do
    get :show, format: :json, id: InvoiceItem.first.id

    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: InvoiceItem.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    get :show, format: :json, id: InvoiceItem.first.id

    assert_equal InvoiceItem.first.id, json_response["id"]
  end

  test "find responds to JSON" do
    get :find, format: :json, id: InvoiceItem.first.id

    assert_response :success
  end

  test "#find returns one record" do
    get :find, format: :json, id: InvoiceItem.first.id

    assert_kind_of Hash, json_response
  end

  test "#find_all responds to json" do
    get :find_all, format: :json
    assert_response :success
  end

  test "#find_all returns an array of records" do
    get :find_all, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#find_all returns the correct number of invoice_items" do
    get :find_all, format: :json
    assert_equal InvoiceItem.count, json_response.count
  end

  test "#find_all conatins invoice_items that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |invoice_item|
      assert invoice_item["item_id"]
      assert invoice_item["invoice_id"]
      assert invoice_item["quantity"]
      assert invoice_item["unit_price"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    invoice_item = json_response

    assert Integer, invoice_item["item_id"].class
  end
end
