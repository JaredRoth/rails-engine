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

  it "#most_revenue" do
    create(:merchant_with_revenue, invoices_count: 3)
    create(:merchant_with_revenue, invoices_count: 2)
    create(:merchant_with_revenue, invoices_count: 1)

    get :most_revenue, quantity: 2, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
    assert_equal "The Gap", parsed_json.first["name"]
  end

  it "#most_items" do
    create(:merchant_with_revenue, invoices_count: 3, name: "Most")
    create(:merchant_with_revenue, invoices_count: 2)
    create(:merchant_with_revenue, invoices_count: 1, name: "Least")

    get :most_items, quantity: 2, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
    assert_equal "Most", parsed_json.first["name"]
    #after changing to expect() syntax, add refution
  end

  it "#date_revenue" do
    skip
    create(:merchant_with_invoices, invoices_count: 3)

    get :date_revenue, date: Date.today, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#revenue without date" do
    create(:merchant_with_revenue, invoices_count: 1)

    get :revenue, id: Merchant.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal "320.0", parsed_json["revenue"]
  end

  it "#revenue with date" do
    skip
    create(:merchant_with_revenue, invoices_count: 1)

    get :revenue, id: Merchant.first.id, date: Date.today, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal "320.0", parsed_json["revenue"]
  end

  it "#favorite_customer" do
    skip
    create(:merchant_for_favorite)

    get :favorite_customer, id: Merchant.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal "Jim", parsed_json["name"]
  end

  it "#customers_with_pending_invoices" do
    skip
  end
end
