class AddPriceNewToWatches < ActiveRecord::Migration[6.1]
  def change
    add_column :watches, :price_new, :integer
  end
end
