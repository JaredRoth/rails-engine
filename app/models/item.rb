class Item < ActiveRecord::Base
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(qty)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"}).group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price)DESC")
    .limit(qty)
  end

  def self.most_items(qty)
    joins(invoices: [:transactions, :invoice_items])
    .where(invoices: {status: "shipped"}).group(:id)
    .order("sum(invoice_items.quantity)DESC").limit(qty)
  end
end
