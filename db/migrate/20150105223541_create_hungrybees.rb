class CreateHungrybees < ActiveRecord::Migration
  def change
    create_table :hungrybees do |t|

      t.timestamps null: false
    end
  end
end
