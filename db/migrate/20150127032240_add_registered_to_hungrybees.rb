class AddRegisteredToHungrybees < ActiveRecord::Migration
  def change
    add_column :hungrybees, :registered, :boolean
  end
end
