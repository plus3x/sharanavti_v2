class YandexMoney < ActiveRecord::Base
  SHOP_ID = 14010
  
  # On check order
  validate :action, equal_to: 'checkOrderRequest', on: :create
  
  # On payment done
  validate :action, inclusion: %w( paymentAvisoRequest ), on: :update
  validates_presence_of :paymentDatetime, on: :update
  
  validates_uniqueness_of :invoiceId, on: :create
  validate :shopId, inclusion: [SHOP_ID]
  validates_presence_of :requestDatetime,
    :action,
    :shopId,
    :invoiceId,
    :customerNumber,
    :orderCreatedDatetime,
    :orderSumAmount,
    :orderSumCurrencyPaycash,
    :orderSumBankPaycash,
    :shopSumAmount,
    :shopSumCurrencyPaycash,
    :shopSumBankPaycash,
    :paymentPayerCode
  
  private
  
    def self.shop_id
      SHOP_ID
    end
end
