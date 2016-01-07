class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.revenue(id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
                   .where("transactions.result = ? AND merchants.id = ?", "success", id)
                   .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.revenue_by_date(id, date)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
                   .where("transactions.result = ? AND merchants.id = ? AND invoices.created_at = ?", "success", id, date)
                   .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.all_merchants_revenue_by_date(date)
    { "total_revenue" => joins(invoices: [:transactions, :invoice_items])
                         .where("transactions.result = ? AND invoices.created_at = ?", "success", date)
                         .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.top_merchants_by_revenue(quantity)
    Merchant.select("merchants.*, count(invoice_items.unit_price * invoice_items.quantity) AS item_revenue")
            .joins(invoices: [:invoice_items, :transactions])
            .where("transactions.result = ?", "success")
            .group("merchants.id")
            .order("item_revenue DESC")
            .take(quantity)
  end

  def self.top_merchants_by_number_sold(quantity)
    # byebug
    ######## do i need to scope down to successfull transactions????????
    Merchant.select("merchants.*, count(invoice_items.quantity) AS item_sold").joins(invoices: :invoice_items)
            .where("transactions.result = ? AND invoice_items.item_id = ?", "success", "")
            .group("merchants.id")
            .order("item_sold DESC")
            .take(quantity)
        # Item.select("items.*, count(invoice_items.quantity) AS item_sold").joins(invoice_items: [invoice: :transactions]).where("transactions.result = ?", "success").group("items.id").order("item_sold DESC").take(quantity)
  end

  def favorite_customer
    Customer.joins(invoices: :transactions)
            .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.customer_id) DESC')
            .first
  end
end
