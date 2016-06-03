class Api::V1::MerchantsController < ApplicationController
  include BasicMethods
  respond_to :json

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity])
  end

  def revenue
    respond_with Merchant.find(params[:id]).revenue
  end

  def favorite_customer
    respond_with Merchant.find(params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

  private

  def model
    Merchant
  end

  def s_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
