class AddCountersToProduct < ActiveRecord::Migration
  def change
    add_column :products, :view_count, :integer, default: 0
    add_column :products, :add_count, :integer, default: 0
    add_column :products, :order_count, :integer, default: 0
  end
end
