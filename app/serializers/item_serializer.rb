class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price

  # has_many :invoice_items, serializer: ItemInvoiceItemSerializer
end
