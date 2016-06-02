class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Customer.find_by(id: params[:id])
    elsif params[:first_name]
      respond_with Customer.find_by(first_name: params[:first_name])
    elsif params[:last_name]
      respond_with Customer.find_by(last_name: params[:last_name])
    elsif params[:created_at]
      respond_with Customer.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Customer.find_by(updated_at: params[:updated_at])
    else

    end
  end
end
