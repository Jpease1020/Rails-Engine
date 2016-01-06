class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.revenue(id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ? AND merchants.id = ?", "success", id).sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.revenue_by_date(id, date)
    { "revenue" => joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ? AND merchants.id = ? AND invoices.created_at = ?", "success", id, date).sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.all_merchants_revenue_by_date(date)
    { "total_revenue" => joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ? AND invoices.created_at = ?", "success", date).sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.top_items_by_revenue(quantity)
    ######## do i need to scope down to successfull transactions????????
    Merchant.select("merchants.*, count(invoice_items.unit_price * invoice_items.quantity) AS item_revenue").joins(invoices: [:invoice_items, :transactions]).where("transactions.result = ?", "success").group("merchants.id").order("item_revenue DESC").take(quantity)
  end

  def self.top_items_by_number_sold(quantity)
    ######## do i need to scope down to successfull transactions????????
    Merchant.select("merchants.*, count(invoice_items.quantity) AS item_sold").joins(invoices: [:invoice_items, :transactions]).where("transactions.result = ?", "success").group("merchants.id").order("item_sold DESC").take(quantity)
  end

end
