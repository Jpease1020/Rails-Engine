require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index eresponds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an aray of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the corect number of items" do
    get :index, format: :json
    assert_equal Item.count, json_response.count
  end

  test "#index conatins items that have the correct properties" do
    get :index, format: :json

    json_response.each do |item|
      assert item["name"]
      assert item["description"]
    end
  end

  test "show responds to JSON" do
    get :show, format: :json, id: Item.first.id

    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Item.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    get :show, format: :json, id: Item.first.id

    assert_equal Item.first.id, json_response["id"]
  end
end
