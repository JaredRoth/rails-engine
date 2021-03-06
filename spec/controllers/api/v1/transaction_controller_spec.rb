require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  it "#index" do
    create_list(:transaction, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:transaction)
    id = Transaction.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find" do
    create(:transaction)
    id = Transaction.first.id

    get :find, credit_card_number: Transaction.first.credit_card_number, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end

  it "#find_all" do
    create_list(:transaction, 2)

    get :find_all, credit_card_number: Transaction.first.credit_card_number, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
  end

  it "#invoice" do
    transaction = create(:transaction)

    get :invoice, id: transaction.id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal transaction.invoice.id, parsed_json["id"]
  end
end
