class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many   :transactions
  has-many   :invoice_items
end
