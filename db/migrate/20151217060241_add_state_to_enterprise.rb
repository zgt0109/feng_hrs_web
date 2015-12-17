class AddStateToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :state, :string
  end
end
