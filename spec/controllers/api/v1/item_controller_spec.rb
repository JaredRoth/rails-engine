require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "#index" do
    create_list(:item, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:item)
    id = Item.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find" do
    create(:item)
    id = Item.first.id

    get :find, description: Item.first.description, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:item, 2)

    get :find_all, description: Item.first.description, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#invoice_items" do
    create(:item_with_invoice_items, invoice_items_count: 3)

    get :invoice_items, id: Item.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#merchant" do
    item = create(:item)

    get :merchant, id: item.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal item.merchant.id, parsed_json["id"]
  end
end
