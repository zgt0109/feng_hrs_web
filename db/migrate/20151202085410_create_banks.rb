class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.datetime :published_at
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
