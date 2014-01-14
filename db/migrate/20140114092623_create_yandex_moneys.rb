class CreateYandexMoneys < ActiveRecord::Migration
  def change
    create_table :yandex_moneys do |t|
      t.references :user, index: true
      t.integer :customerid
      t.integer :sum
      t.integer :gems
      t.integer :invoiceid

      t.timestamps
    end
  end
end
