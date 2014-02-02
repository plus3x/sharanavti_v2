class YandexMoney < ActiveRecord::Base
  SHOP_ID = 14010
  
  # On check order
  validate :action, inclusion: %w( checkOrderRequest ), on: :create
  
  # On payment done
  before_validation do
    if action == "paymentAvisoRequest" and paymentDatetime.nil?
      errors.add(:paymentDatetime, "can't be blank!")
    end
  end
  
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

    def self.log
      @@log ||= Logger.new("#{Rails.root}/log/yandex_money_#{Rails.env}.log")
    end
end
