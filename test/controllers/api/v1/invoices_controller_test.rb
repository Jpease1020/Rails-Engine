require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of invoices" do
    get :index, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "#index conatins invoices that have the correct properties" do
    get :index, format: :json

    json_response.each do |invoices|
      assert invoices["customer_id"]
      assert invoices["merchant_id"]
      assert invoices["status"]
    end
  end

  test "show responds to JSON" do
    get :show, format: :json, id: Customer.first.id

    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Customer.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    get :show, format: :json, id: Customer.first.id

    assert_equal Customer.first.id, json_response["id"]
  end

  test "find responds to JSON" do
    get :find, format: :json, id: Customer.first.id

    assert_response :success
  end

  test "#find returns one record" do
    get :find, format: :json, id: Customer.first.id

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

  test "#find_all returns the correct number of invoices" do
    get :find_all, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "#find_all conatins invoices that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |invoices|
      assert invoices["customer_id"]
      assert invoices["merchant_id"]
      assert invoices["status"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    invoices = json_response

    assert String, invoices["first_name"].class
  end
end
