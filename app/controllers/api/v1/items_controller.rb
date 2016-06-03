class Api::V1::ItemsController < ApplicationController
  include BasicMethods
  respond_to :json

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  private
  
  def model
    Item
  end

  def s_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
