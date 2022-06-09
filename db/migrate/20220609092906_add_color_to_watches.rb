class AddColorToWatches < ActiveRecord::Migration[6.1]
  def change
    add_column :watches, :color, :string
  end
end
