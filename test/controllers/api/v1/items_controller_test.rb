require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  def setup
    create_data
  end

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
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

  test "find responds to JSON" do
    get :find, format: :json, id: Item.first.id

    assert_response :success
  end

  test "#find returns one record" do
    get :find, format: :json, id: Item.first.id

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

  test "#find_all returns the correct number of items" do
    get :find_all, format: :json
    assert_equal Item.count, json_response.count
  end

  test "#find_all conatins items that have the correct properties" do
    get :find_all, format: :json

    json_response.each do |item|
      assert item["name"]
      assert item["description"]
    end
  end

  test "random responds to JSON" do
    get :random, format: :json

    assert_response :success
  end

  test "#random returns one record" do
    get :random, format: :json
    item = json_response

    assert item["description"].start_with?("Description")
  end

  test "#most_revenue returns the top x items ranked by total revenue generated" do
    get :most_revenue, quantity: 5, format: :json

    assert_response :success
# byebug
    assert_equal 5, json_response.count

    top_item_revenue = json_response.first["item_revenue"]
    second_to_top_item_revenue = json_response.second["item_revenue"]
    assert_equal 45, json_response.first["item_revenue"]
    assert_equal 6, json_response.last["item_revenue"]

    assert_operator top_item_revenue, :>, second_to_top_item_revenue
  end
  # def most_items
  #   respond_with Item.top_items_by_number_sold(params[:quantity])
  # end
  #
  # def best_day
  #   respond_with({"best_day" => Item.best_day(params[:id])})
  # end


end
