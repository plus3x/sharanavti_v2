class CreateYandexMoneys < ActiveRecord::Migration
  def change
    create_table :yandex_moneys do |t|
      t.datetime :requestDatetime
      t.string :action
      t.integer :shopId
      t.integer :shopArticleId
      t.string :invoiceId
      t.string :customerNumber
      t.datetime :orderCreatedDatetime
      t.float :orderSumAmount
      t.float :orderSumCurrencyPaycash
      t.float :orderSumBankPaycash
      t.float :shopSumAmount
      t.float :shopSumCurrencyPaycash
      t.float :shopSumBankPaycash
      t.datetime :paymentDatetime
      t.string :paymentPayerCode
      t.integer :user_id
      t.integer :gemSum

      t.timestamps
    end
  end
end
