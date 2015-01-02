class AddIndexToHungryBeesPhoneNumber < ActiveRecord::Migration
  def change
    add_index :hungry_bees, :phone_number, unique: true
  end
end
