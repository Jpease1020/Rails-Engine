require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of transaction" do
    get :index, format: :json
    assert_equal Transaction.count, json_response.count
  end

  test "#index conatins transaction that have the correct properties" do
    get :index, format: :json

    json_response.each do |transaction|
      assert transaction["invoice_id"]
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end

  test "show responds to JSON" do
    get :show, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Transaction.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct transaction" do
    get :show, format: :json, id: Transaction.first.id

    assert_equal Transaction.first.id, json_response["id"]
  end

  test "find responds to JSON" do
    get :find, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "#find returns one record" do
    get :find, format: :json, id: Transaction.first.id

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

  test "#find_all returns the correct number of transaction" do
    get :find_all, format: :json
    assert_equal Transaction.count, json_response.count
  end

  test "#find_all conatins transaction that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |transaction|
      assert transaction["invoice_id"]
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    transaction = json_response

    assert String, transaction["name"].class
  end
end
