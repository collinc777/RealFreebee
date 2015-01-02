class AddPhoneNumberToHungryBees < ActiveRecord::Migration
  def change
    add_column :hungry_bees, :phone_number, :string
  end
end
