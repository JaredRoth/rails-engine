class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Invoice.find_by(id: params[:id])
    elsif params[:status]
      respond_with Invoice.find_by(status: params[:status])
    elsif params[:customer_id]
      respond_with Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      respond_with Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Invoice.find_by(updated_at: params[:updated_at])
    else

    end
  end
end
