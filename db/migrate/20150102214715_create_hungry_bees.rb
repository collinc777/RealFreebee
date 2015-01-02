class CreateHungryBees < ActiveRecord::Migration
  def change
    create_table :hungry_bees do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
