class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.select('merchants.*, COUNT(transactions.id) AS transactions_count')
    .where(transactions: {result: "success"})
    .joins(:transactions).group('merchants.id')
    .order('transactions_count DESC').first
  end
end
