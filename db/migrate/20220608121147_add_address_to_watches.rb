class AddAddressToWatches < ActiveRecord::Migration[6.1]
  def change
    add_column :watches, :address, :text
  end
end
