require "rails_helper"

RSpec.describe Api::V1::InvoicesController, type: :controller do
  it "#index" do
    create_list(:invoice, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:invoice)
    id = Invoice.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(id).to eq(parsed_json["id"])
  end

  it "#find" do
    create(:invoice)
    id = Invoice.first.id

    get :find, status: Invoice.first.status, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:invoice, 2)

    get :find_all, status: Invoice.first.status, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#transactions" do
    create(:invoice_with_transactions, transactions_count: 3)

    get :transactions, id: Invoice.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#invoice_items" do
    create(:invoice_with_invoice_items, invoice_items_count: 3)

    get :invoice_items, id: Invoice.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#items" do
    create(:invoice_with_items, items_count: 3)

    get :items, id: Invoice.first.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 3, parsed_json.count
  end

  it "#customer" do
    invoice = create(:invoice)

    get :customer, id: invoice.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice.customer.id, parsed_json["id"]
  end

  it "#merchant" do
    invoice = create(:invoice)

    get :merchant, id: invoice.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice.merchant.id, parsed_json["id"]
  end
end
