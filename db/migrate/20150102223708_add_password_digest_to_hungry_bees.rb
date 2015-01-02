class AddPasswordDigestToHungryBees < ActiveRecord::Migration
  def change
    add_column :hungry_bees, :password_digest, :string
  end
end
