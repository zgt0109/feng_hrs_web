class AddBalanceToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :balance, :decimal, precision: 10, scale: 2
  end
end
