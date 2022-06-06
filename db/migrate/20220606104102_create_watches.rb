class CreateWatches < ActiveRecord::Migration[6.1]
  def change
    create_table :watches do |t|
      t.integer :price
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
