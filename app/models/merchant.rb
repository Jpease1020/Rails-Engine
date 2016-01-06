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



#   def self.all_merchants_revenue_by_date(date)
#     joins(invoices: [:transactions, :invoice_items])
#       .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
#       .where("transactions.result = ? AND transactions.created_at = ?", "success", date)
#       # .sum("invoice_items.quantity * invoice_items.unit_price")
#   end
#
#   def self.revenue_by_date(date = nil, id)
#     joins(invoices: [:transactions, :invoice_items])
#       .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
#       .where("transactions.result = ? AND merchants.id = ?", "success", params[:id])
#       .where("transactions.created_at = ?",  params[:date])
#       # .sum("invoice_items.quantity * invoice_items.unit_price")
#   end
#
#   def self.revenue(id)
#     invoices.joins(:transactions, :invoice_items)
#       .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
#       .where("transactions.result = ? AND merchants.id = ?", "success", id)
#       # .sum("invoice_items.quantity * invoice_items.unit_price")
#   end
end
# invoices.joins(:invoice_items).sum('quantity * unit_price')
