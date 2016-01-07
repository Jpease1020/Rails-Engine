require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of merchants" do
    get :index, format: :json
    assert_equal Merchant.count, json_response.count
  end

  test "#index conatins merchants that have the correct properties" do
    get :index, format: :json

    json_response.each do |merchant|
      assert merchant["name"]
    end
  end

  test "show responds to JSON" do
    get :show, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Merchant.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct merchant" do
    get :show, format: :json, id: Merchant.first.id

    assert_equal Merchant.first.id, json_response["id"]
  end

  test "find responds to JSON" do
    get :find, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#find returns one record" do
    get :find, format: :json, id: Merchant.first.id

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

  test "#find_all returns the correct number of merchants" do
    get :find_all, format: :json
    assert_equal Merchant.count, json_response.count
  end

  test "#find_all conatins merchants that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |merchant|
      assert merchant["name"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    merchant = json_response

    assert String, merchant["name"].class
  end

  test "test #favorite_customer returns the customer who has conducted the most successful transactions for a merchant" do

    get :favorite_customer, id: 1, format: :json

    assert_response :success
    response = json_response

    assert_equal 'Jeff', response["first_name"]
  end

  test "#revenue returns the total revenue for that merchant across all transactions" do
    get :revenue, id: 1, format: :json
    assert_response :success

    assert_equal "69.95", json_response["revenue"]
  end

  test "#most_revenue?quantity=x returns the top x merchants ranked by total revenue" do
    get :most_revenue, quantity: 2, format: :json

    assert_response :success
    top_merchant = json_response.first
    assert_equal 2, json_response.count

    assert_equal "Bobs Shoes", json_response.first["name"]
  end

  test "#most_items?quantity=x returns the top x merchants ranked by total items sold" do
    get :most_revenue, quantity: 2, format: :json

    assert_response :success
    top_merchant = json_response.first
    assert_equal 2, json_response.count

    assert_equal "Bobs Shoes", json_response.first["name"]
  end

end
