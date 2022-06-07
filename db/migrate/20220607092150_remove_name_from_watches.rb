class RemoveNameFromWatches < ActiveRecord::Migration[6.1]
  def change
    rename_column :watches, :name, :model
  end
end
