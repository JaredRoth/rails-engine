class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :item_id, :invoice_id
  attribute :monetize, key: :unit_price

  # belongs_to :items, serializer: ItemInvoiceItemSerializer
  # belongs_to :invoices, serializer: InvoiceInvoiceItemSerializer

  def monetize
    (object.unit_price * 0.01).to_s
  end
end
