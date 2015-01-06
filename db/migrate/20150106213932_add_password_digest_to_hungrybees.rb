class AddPasswordDigestToHungrybees < ActiveRecord::Migration
  def change
    add_column :hungrybees, :password_digest, :string
  end
end
