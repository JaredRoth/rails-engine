class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with InvoiceItem.find_by(id: params[:id])
    elsif params[:item_id]
      respond_with InvoiceItem.find_by(item_id: params[:item_id])
    elsif params[:invoice_id]
      respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      respond_with InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      respond_with InvoiceItem.find_by(unit_price: params[:unit_price])
    elsif params[:created_at]
      respond_with InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with InvoiceItem.find_by(updated_at: params[:updated_at])
    else

    end
  end

  def find_all
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with InvoiceItem.where(id: params[:id])
    elsif params[:item_id]
      respond_with InvoiceItem.where(item_id: params[:item_id])
    elsif params[:invoice_id]
      respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      respond_with InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      respond_with InvoiceItem.where(unit_price: params[:unit_price])
    elsif params[:created_at]
      respond_with InvoiceItem.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with InvoiceItem.where(updated_at: params[:updated_at])
    else

    end
  end
end
