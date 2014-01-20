class YandexMoney < ActiveRecord::Base
  SHOP_ID = 14010
  
  # for check order
  before_save do
    validate :action, inclusion: %w( checkOrderRequest )
  end
  
  # for payment done
  before_update do
    validate :action, inclusion: %w( paymentAvisoRequest )
    validates_presence_of :paymentDatetime
  end

  validate :shopId, inclusion: [SHOP_ID]
  validates_presence_of :requestDatetime,
    :action,
    :shopId,
    :shopArticleId,
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
  
    def self.scid
      SCID
    end
end
