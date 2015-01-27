class AddIsRegisteredColumnToHungrybees < ActiveRecord::Migration
  def change
    add_column :hungrybees, :is_registered?, :boolean
  end
end