class CreateLedgerImports < ActiveRecord::Migration
  def change
    create_table :ledger_imports do |t|
      t.text :purchaser_name
      t.text :item_description
      t.decimal :item_price
      t.integer :purchase_count
      t.text :merchant_address
      t.text :merchant_name

      t.timestamps
    end
  end
end
