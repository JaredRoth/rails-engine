module BasicMethods
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end

  def find
    if params[:unit_price]
      string_price = (params[:unit_price].to_d * 100).to_i
      respond_with model.find_by(unit_price: string_price)
    else
      respond_with model.find_by(s_params)
    end
  end

  def find_all
    if params[:unit_price]
      string_price = (params[:unit_price].to_d * 100).to_i
      respond_with model.where(unit_price: string_price)
    else
      respond_with model.where(s_params)
    end
  end

  def random
    respond_with model.order("RANDOM()").first
  end
end
