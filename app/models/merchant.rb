class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(qty)
    joins(:invoice_items).group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price)DESC")
    .limit(qty)
  end
end
