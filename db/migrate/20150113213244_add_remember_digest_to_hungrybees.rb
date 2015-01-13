class AddRememberDigestToHungrybees < ActiveRecord::Migration
  def change
    add_column :hungrybees, :remember_digest, :string
  end
end
