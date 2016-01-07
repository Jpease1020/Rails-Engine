class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant.joins(:invoices)
            .joins(:transactions)
            .where("invoices.customer_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.merchant_id) DESC')
            .first

    # successfull_invocies = Invoice.joins(:transactions).where("transactions.result = ?", "success")
    # merchant_purchases = successfull_invocies.group(:merchant_id)
    # merchant_id = merchant_purchases.max_by { |_, v| v }.first
    # Merchant.find(merchant_id)


    # Customer.join()
    # Customer.joins(:invoices).select("")
  end

  def self.customers_with_pending_invoices
    Customer.joins(invoices: [:transactions, :merchant]).where("transactions.result = ? AND merchants.id = ?", "failed", params[:id]).distinct
  end

end
