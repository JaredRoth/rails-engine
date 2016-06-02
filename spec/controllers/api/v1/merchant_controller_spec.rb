require "rails_helper"

RSpec.describe Api::V1::MerchantsController, type: :controller do
  it "#index" do
    create_list(:merchant, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:merchant)
    id = Merchant.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find" do
    create(:merchant)
    id = Merchant.first.id

    get :find, name: Merchant.first.name, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:merchant, 2)

    get :find_all, name: Merchant.first.name, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#items" do
    create(:merchant_with_items, items_count: 3)

    get :items, id: Merchant.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#invoices" do
    create(:merchant_with_invoices, invoices_count: 3)

    get :invoices, id: Merchant.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end
end
