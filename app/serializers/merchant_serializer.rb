class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  # has_many :invoices, serializer: MerchantInvoiceSerializer
  # has_many :items, serializer: MerhcantItemSerializer
end
