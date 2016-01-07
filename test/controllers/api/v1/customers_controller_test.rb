require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of customers" do
    get :index, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "#index conatins customers that have the correct properties" do
    get :index, format: :json

    json_response.each do |customer|
      assert customer["first_name"]
      assert customer["last_name"]
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

  test "#find_all returns the correct number of customers" do
    get :find_all, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "#find_all conatins customers that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |customer|
      assert customer["first_name"]
      assert customer["last_name"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    customer = json_response

    assert String, customer["first_name"].class
  end
end
