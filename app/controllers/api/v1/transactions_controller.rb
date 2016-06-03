class Api::V1::TransactionsController < ApplicationController
  include BasicMethods
  respond_to :json

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private

  def model
    Transaction
  end

  def s_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end
end
