class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price

  # belongs_to :items, serializer: ItemInvoiceItemSerializer
  # belongs_to :invoices, serializer: InvoiceInvoiceItemSerializer
end
