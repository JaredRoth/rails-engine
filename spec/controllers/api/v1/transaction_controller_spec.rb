require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  it "#index" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    # expect(parsed_json.count).to eq(2)
  end

  it "#show" do
    create(:transaction)
    id = Transaction.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal id, parsed_json["id"]
  end
end
