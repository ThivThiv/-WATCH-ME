class AddBrandToWatches < ActiveRecord::Migration[6.1]
  def change
    add_column :watches, :brand, :string
  end
end
