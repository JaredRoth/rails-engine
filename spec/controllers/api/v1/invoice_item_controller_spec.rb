require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  it "#index" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    # expect(parsed_json.count).to eq(2)

  end
end
