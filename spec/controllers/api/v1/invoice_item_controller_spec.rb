require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  it "#index" do
    create_list(:invoice_item, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:invoice_item)
    id = InvoiceItem.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find" do
    create(:invoice_item)
    id = InvoiceItem.first.id

    get :find, quantity: InvoiceItem.first.quantity, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:invoice_item, 2)

    get :find_all, quantity: InvoiceItem.first.quantity, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#invoice" do
    invoice_item = create(:invoice_item)

    get :invoice, id: invoice_item.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice_item.invoice.id, parsed_json["id"]
  end

  it "#item" do
    invoice_item = create(:invoice_item)

    get :item, id: invoice_item.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice_item.item.id, parsed_json["id"]
  end
end
