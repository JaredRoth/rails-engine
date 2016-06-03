require "rails_helper"

RSpec.describe Merchant, type: :model do
  describe ".most_revenue" do
    it "returns the top x items ranked by generated revenue" do
      create(:merchant_with_revenue, invoices_count: 3, name: "Most")
      create(:merchant_with_revenue, invoices_count: 2, name: "Second")
      create(:merchant_with_revenue, invoices_count: 1, name: "Least")

      expect(Merchant.most_revenue(2).first.name).to eq("Most")
      expect(Merchant.most_revenue(2).last.name).to eq("Second")
    end
  end

  describe ".most_items" do
    it "returns the top x items ranked by items sold" do
      create(:merchant_with_revenue, invoices_count: 3, name: "Most")
      create(:merchant_with_revenue, invoices_count: 2, name: "Second")
      create(:merchant_with_revenue, invoices_count: 1, name: "Least")

      expect(Merchant.most_items(2).first.name).to eq("Most")
      expect(Merchant.most_items(2).last.name).to eq("Second")
    end
  end

  # describe ".revenue" do
  #   it "returns the top x items ranked by generated revenue" do
  #     create(:item)
  #     expect(InvoiceItem.first.item.class).to eq(Item)
  #   end
  # end

  describe "#revenue" do
    it "returns the total revenue for that merchant across all transactions" do
      create(:merchant_with_revenue, invoices_count: 1)
      expect(Merchant.first.revenue["revenue"]).to eq("320.0")
    end
  end

  # describe "#favorite_customer" do
  #   it "returns the customer who has conducted the most total number of successful transactions" do
  #     create(:item)
  #     expect(InvoiceItem.first.item.class).to eq(Item)
  #   end
  # end

  # describe "#customers_with_pending_invoices" do
  #   it "returns the top x items ranked by generated revenue" do
  #     create(:item)
  #     expect(InvoiceItem.first.item.class).to eq(Item)
  #   end
  # end
end
