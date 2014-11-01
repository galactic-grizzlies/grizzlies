class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :delivery_from
      t.integer :delivery_to

      t.timestamps
    end
  end
end
