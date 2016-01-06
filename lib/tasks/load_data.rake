require 'csv'

namespace :db do
  desc "Convert CSV files into corresponding model objects"
  task :load_data => :environment do

    file = File.read('data/customers.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
        Customer.create!(row.to_hash)
    end

    file = File.read('data/invoice_items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
        row['unit_price'] = row['unit_price'].to_f / 100
        InvoiceItem.create!(row.to_hash)
    end

    file = File.read('data/invoices.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
        Invoice.create!(row.to_hash)
    end

    file = File.read('data/items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
        row['unit_price'] = row['unit_price'].to_f / 100
        Item.create!(row.to_hash)
    end

    file = File.read('data/merchants.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
        Merchant.create!(row.to_hash)
    end

    file = File.read('data/transactions.csv')
    csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
    csv.each do |row|
        Transaction.create!(row.to_hash.except(:credit_card_expiration_date))
    end
  end
end
