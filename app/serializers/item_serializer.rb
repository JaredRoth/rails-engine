class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  attribute :monetize, key: :unit_price
  belongs_to :merchant_id

  # has_many :invoice_items, serializer: ItemInvoiceItemSerializer

  def monetize
    (object.unit_price * 0.01).to_s
  end
end
