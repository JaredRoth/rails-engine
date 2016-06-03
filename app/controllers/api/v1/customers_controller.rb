class Api::V1::CustomersController < ApplicationController
  include BasicMethods
  respond_to :json

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find(params[:id]).favorite_merchant
  end

  private

  def model
    Customer
  end

  def s_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
