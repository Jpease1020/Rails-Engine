class Api::V1::Customers::MerchantController < ApplicationController
  respond_to :json

  def show
    # .customers_favorite_merchant
    respond_with Merchant.select("merchants.*, count(invoices.merchant_id) AS merchant_count")
                          .joins(invoices: :transactions)
                          .where("transactions.result = ?", "success")
                          .group("invoices.merchant_id")
                          .order("merchant_count DESC")
                          .take(1)
  end
end
