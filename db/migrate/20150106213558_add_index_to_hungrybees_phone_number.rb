class AddIndexToHungrybeesPhoneNumber < ActiveRecord::Migration
  def change
    add_index :hungrybees, :phone_number, unique: true
  end
end
