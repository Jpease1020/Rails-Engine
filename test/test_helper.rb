ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  DatabaseCleaner.strategy = :transaction

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def create_data
    customer = Customer.create(first_name: "this", last_name: "guy")
    customer = Customer.create(first_name: "second", last_name: "dude")
    customer = Customer.create(first_name: "third", last_name: "person")
    customer = Customer.create(first_name: "fourth", last_name: "human")
    customer = Customer.create(first_name: "fifth", last_name: "girl")
    merchant = Merchant.create(name: "First Store")
    merchant = Merchant.create(name: "Second Store")
    merchant = Merchant.create(name: "Third Store")
    merchant = Merchant.create(name: "Fourth Store")
    merchant = Merchant.create(name: "Fifth Store")
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 2, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 3, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 4, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 2, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 3, merchant_id: 2, status: "shipped")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "failed")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "failed")
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 5, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 6, invoice_id: 6, quantity: 3, unit_price: 63.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 5, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 6, invoice_id: 6, quantity: 3, unit_price: 63.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 6, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
  end
end

class ActionController::TestCase
  def json_response
    JSON.parse(response.body)
  end

  def create_data
    customer = Customer.create(first_name: "this", last_name: "guy")
    customer = Customer.create(first_name: "second", last_name: "dude")
    customer = Customer.create(first_name: "third", last_name: "person")
    customer = Customer.create(first_name: "fourth", last_name: "human")
    customer = Customer.create(first_name: "fifth", last_name: "girl")
    merchant = Merchant.create(name: "First Store")
    merchant = Merchant.create(name: "Second Store")
    merchant = Merchant.create(name: "Third Store")
    merchant = Merchant.create(name: "Fourth Store")
    merchant = Merchant.create(name: "Fifth Store")
    invoice = Invoice.create(customer_id: 1, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 2, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 3, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 4, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 2, merchant_id: 2, status: "shipped")
    invoice = Invoice.create(customer_id: 3, merchant_id: 2, status: "shipped")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 3, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 4, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 5, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "success")
    transaction = Transaction.create(invoice_id: 2, credit_card_number: "1", result: "failed")
    transaction = Transaction.create(invoice_id: 1, credit_card_number: "1", result: "failed")
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 5, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 6, invoice_id: 6, quantity: 3, unit_price: 63.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 5, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 6, invoice_id: 6, quantity: 3, unit_price: 63.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 3, unit_price: 23.55)
    invoice_item = InvoiceItem.create(item_id: 4, invoice_id: 4, quantity: 3, unit_price: 23.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 5, quantity: 3, unit_price: 23.47)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 6, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
    invoice_item = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: 13.45)
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 25.45)
  end
end
