class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant.joins(invoices: :transactions)
            .where("invoices.customer_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.merchant_id) DESC')
            .first
  end

  def self.customers_with_pending_invoices(id)
    Customer.joins(invoices: [:transactions, :merchant]).
             where("transactions.result = ? AND merchants.id = ?", "failed", id).
             distinct
  end

end
