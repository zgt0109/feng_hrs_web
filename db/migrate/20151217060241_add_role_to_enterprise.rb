class AddRoleToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :role, :string
  end
end
