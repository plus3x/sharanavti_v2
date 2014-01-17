class YandexMoney < ActiveRecord::Base
  SHOP_ID = 41010
  
  # for check order
  before_save do
  end
  
  # for payment done
  before_update do
  end
  
  validates_presence_of :requestDatetime, :action, :shopId, :shopArticleId, :invoiceId, :customerNumber, :orderCreatedDatetime, :orderSumAmount, :orderSumCurrencyPaycash, :orderSumBankPaycash, :shopSumAmount, :shopSumCurrencyPaycash, :shopSumBankPaycash, :paymentPayerCode
  
  def self.shop_id
    SHOP_ID
  end
end
