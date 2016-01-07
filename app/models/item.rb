class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  def self.top_items_by_revenue(quantity)
    select("items.*, count(invoice_items.unit_price * invoice_items.quantity) AS item_revenue")
        .joins(invoice_items: [invoice: :transactions])
        .group("items.id")
        .where("transactions.result = ?", "success")
        .order("item_revenue DESC")
        .take(quantity)
  end

  def self.top_items_by_number_sold(quantity)
    select("items.*, count(invoice_items.quantity) AS item_sold")
        .joins(invoice_items: [invoice: :transactions])
        .where("transactions.result = ?", "success")
        .group("items.id")
        .order("item_sold DESC")
        .take(quantity)
  end
end
