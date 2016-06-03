class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(qty)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"}).group(:id)
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
    total = invoices.joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .sum("invoice_items.quantity * invoice_items.unit_price")
    {"revenue" => (total/100.0).to_s}
  end

  def favorite_customer
    customers.select('customers.*, COUNT(transactions.id) AS transactions_count')
    .where(transactions: {result: "success"})
    .joins(:transactions).group('customers.id')
    .order('transactions_count DESC').first
  end

  def customers_with_pending_invoices
    customers.where.not(transactions: {result: "success"})
    .joins(:transactions).group(:id)
  end
end
