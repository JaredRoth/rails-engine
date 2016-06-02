class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Transaction.find_by(id: params[:id])
    elsif params[:invoice_id]
      respond_with Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      respond_with Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:result]
      respond_with Transaction.find_by(result: params[:result])
    elsif params[:created_at]
      respond_with Transaction.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Transaction.find_by(updated_at: params[:updated_at])
    else

    end
  end

  def find_all
    # respond_with Customer.find_by(params[:paramaters].keys.first params[:paramaters].values.first)
    if params[:id]
      respond_with Transaction.where(id: params[:id])
    elsif params[:invoice_id]
      respond_with Transaction.where(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      respond_with Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      respond_with Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:result]
      respond_with Transaction.where(result: params[:result])
    elsif params[:created_at]
      respond_with Transaction.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Transaction.where(updated_at: params[:updated_at])
    else

    end
  end

end
