class AddInfoToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :name, :string
    add_column :enterprises, :mobile, :string
  end
end
