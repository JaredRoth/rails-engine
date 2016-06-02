class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Item.find_by(id: params[:id])
    elsif params[:name]
      respond_with Item.find_by(name: params[:name])
    elsif params[:description]
      respond_with Item.find_by(description: params[:description])
    elsif params[:unit_price]
      respond_with Item.find_by(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      respond_with Item.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Item.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Item.find_by(updated_at: params[:updated_at])
    else

    end
  end

  def find_all
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Item.where(id: params[:id])
    elsif params[:name]
      respond_with Item.where(name: params[:name])
    elsif params[:description]
      respond_with Item.where(description: params[:description])
    elsif params[:unit_price]
      respond_with Item.where(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Item.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Item.where(updated_at: params[:updated_at])
    else

    end
  end

  def random
    respond_with Item.order("RANDOM()").first
  end
end
