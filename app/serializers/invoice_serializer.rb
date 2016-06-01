class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :status

  # has_many :invoice_items, serializer: InvoiceInvoiceItemSerializer
  # has_many :items, through: :invoice_items
  # has_many :transactions, serializer: InvoiceTransactionSerializer
end
