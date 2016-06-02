class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(qty)
    joins(:invoice_items).group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price)DESC")
    .limit(qty)
  end

  def self.most_items(qty)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"}).group(:id)
    .order("sum(invoice_items.quantity)DESC").limit(qty)
  end

  def self.revenue(date)
    # GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants
    # Assume the dates provided match the format of a standard ActiveRecord timestamp.
  end

  def revenue

  end
  # GET /api/v1/merchants/:id/revenue
end
