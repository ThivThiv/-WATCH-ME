class AddTagToWatches < ActiveRecord::Migration[6.1]
  def change
    add_column :watches, :tag, :string
  end
end
