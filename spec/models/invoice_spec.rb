require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "#item" do
    it "returns the associated item" do
      create(:invoice_item)
      expect(InvoiceItem.first.item.class).to eq(Item)
    end
  end

  describe "#invoice" do
    it "returns the associated invoice" do
      create(:invoice_item)
      expect(InvoiceItem.first.invoice.class).to eq(Invoice)
    end
  end
end
