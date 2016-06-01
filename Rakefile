# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'csv'

Rails.application.load_tasks

namespace :sanitation do
  desc "Check line lengths & whitespace with Cane"
  task :lines do
    puts ""
    puts "== using cane to check line length =="
    system("cane --no-abc --style-glob 'lib/**/*.rb' --no-doc")
    puts "== done checking line length =="
    puts ""
  end

  desc "Check method length with Reek"
  task :methods do
    puts ""
    puts "== using reek to check method length =="
    system("reek -n lib/*.rb 2>&1 | grep -v ' 0 warnings'")
    puts "== done checking method length =="
    puts ""
  end

  desc "Check both line length and method length"
  task :all => [:lines, :methods]
end

namespace :import do
  task :all => :environment do
    CSV.foreach("data/customers.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
    CSV.foreach("data/merchants.csv", :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
    CSV.foreach("data/items.csv", :headers => true) do |row|
      Item.create!(row.to_hash)
    end
    CSV.foreach("data/invoices.csv", :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
    CSV.foreach("data/transactions.csv", :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
    CSV.foreach("data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end
end
