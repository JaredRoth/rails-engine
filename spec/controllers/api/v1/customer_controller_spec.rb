require "rails_helper"

RSpec.describe Api::V1::CustomersController, type: :controller do
  it "#index" do
    create_list(:customer, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:customer)
    id = Customer.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find" do
    create(:customer)
    id = Customer.first.id

    get :find, first_name: Customer.first.first_name, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:customer, 2)

    get :find_all, first_name: Customer.first.first_name, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#invoices" do
    create(:customer_with_invoices, invoices_count: 3)

    get :invoices, id: Customer.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#transactions" do
    create(:customer_with_transactions, transactions_count: 3)

    get :transactions, id: Customer.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end
end
