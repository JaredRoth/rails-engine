FactoryGirl.define do
  factory :customer do
    first_name "Jim"
    last_name "Bob"

    factory :customer_with_invoices do
      transient do
        invoices_count 1
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoices_count, customer: customer)
      end
    end

    factory :customer_with_transactions do
      transient do
        transactions_count 1
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice_with_transactions, evaluator.transactions_count, customer: customer)
      end
    end
  end

  factory :merchant do
    name "The Gap"

    factory :merchant_with_items do
      transient do
        items_count 1
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end

    factory :merchant_with_invoices do
      transient do
        invoices_count 1
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
      end
    end

    factory :merchant_with_revenue do
      transient do
        invoices_count 1
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice_with_invoice_items, evaluator.invoices_count, merchant: merchant)
      end
    end

    factory :merchant_with_sold_items do
      transient do
        invoices_count 1
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice_with_invoice_items_and_transactions, evaluator.invoices_count, merchant: merchant)
      end
    end

    # factory :merchant_for_favorite do
    #   transient do
    #     customers_count 1
    #   end
    #
    #   after(:create) do |merchant, evaluator|
    #     create_list(
    #     :customer_with_transactions,
    #     evaluator.customers_count, merchant: merchant
    #     )
    #   end
    # end
  end

  factory :item do
    merchant
    name "Jeans"
    description "They be tight"
    unit_price 8000

    factory :item_with_invoice_items do
      transient do
        invoice_items_count 1
      end

      after(:create) do |item, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, item: item)
      end
    end
  end

  factory :invoice do
    customer
    merchant
    status "Paid"

    factory :invoice_with_transactions do
      transient do
        transactions_count 1
      end

      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)
      end
    end

    factory :invoice_with_invoice_items do
      transient do
        invoice_items_count 1
      end

      after(:create) do |invoice, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end

    factory :invoice_with_invoice_items_and_transactions do
      transient do
        invoice_items_count 2
        transaction_count 2
      end

      after(:create) do |invoice, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
        create_list(:transaction, evaluator.transaction_count, invoice: invoice)
      end
    end

    factory :invoice_with_items do
      transient do
        items_count 1
      end

      after(:create) do |invoice, evaluator|
        create_list(:item, evaluator.items_count, invoices: [invoice])
      end
    end
  end

  factory :transaction do
    invoice
    result "success"
    credit_card_number "4111111111111111"
    credit_card_expiration_date Date.today
  end

  factory :invoice_item do
    item
    invoice
    quantity 1
    unit_price 8000
  end
end
