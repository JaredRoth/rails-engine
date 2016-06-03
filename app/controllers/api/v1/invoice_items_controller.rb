class Api::V1::InvoiceItemsController < ApplicationController
  include BasicMethods
  respond_to :json

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  private
  
  def model
    InvoiceItem
  end

  def s_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
