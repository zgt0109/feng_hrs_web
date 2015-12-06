class RemoveEmailUniqueToEnterprise < ActiveRecord::Migration
  def change
    remove_index :enterprises, :email
    add_index :enterprises, :email
  end
end
