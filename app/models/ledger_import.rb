class LedgerImport < ActiveRecord::Base
  validates_presence_of [
    :purchaser_name, :item_description, :item_price,
    :purchase_count, :merchant_address, :merchant_name
  ]

  def self.import_from_tab_delimited_string(tds)
    successful_ledger_imports = []
    failed_ledger_imports = []

    CSV.parse(tds, { :headers => true, :col_sep => "\t", :skip_blanks => true }) do |row|
      ledger_import = LedgerImport.new(
        purchaser_name: row[0],
        item_description: row[1],
        item_price: row[2],
        purchase_count: row[3],
        merchant_address: row[4],
        merchant_name: row[5]
      )

      ledger_import.save ?
        successful_ledger_imports << ledger_import :
        failed_ledger_imports << row.to_csv(col_sep: "\t")
    end

    { successful_imports: successful_ledger_imports, failed_imports: failed_ledger_imports }
  end
end
