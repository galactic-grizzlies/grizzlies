class AddShortDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :short_description, :string, before: 'description'
  end
end
