class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Merchant.find_by(id: params[:id])
    elsif params[:name]
      respond_with Merchant.find_by(name: params[:name])
    elsif params[:created_at]
      respond_with Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.find_by(updated_at: params[:updated_at])
    else

    end
  end

  def find_all
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Merchant.where(id: params[:id])
    elsif params[:name]
      respond_with Merchant.where(name: params[:name])
    elsif params[:created_at]
      respond_with Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.where(updated_at: params[:updated_at])
    else

    end
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end
end
