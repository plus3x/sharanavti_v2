class AddIndexForInvoiceIdToYandexMoneys < ActiveRecord::Migration
  def change
    add_index :yandex_moneys, :invoiceId
  end
end
