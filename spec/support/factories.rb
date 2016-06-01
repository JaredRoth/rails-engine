FactoryGirl.define do
  factory :customer do
    first_name "Jim"
    last_name "Bob"
  end

  factory :merchant do
    name "The Gap"
  end

  factory :item do
    merchant
    name "Jeans"
    description "They be tight"
    unit_price 8000
  end

  factory :invoice do
    customer
    merchant
    status "Paid"
  end

  factory :transaction do
    invoice
    credit_card_number "4111111111111111"
    credit_card_expiration_date Date.today
  end

  factory :invoice_item do
    item
    invoice
    quantity 1
    # unit_price 8000
  end
end
