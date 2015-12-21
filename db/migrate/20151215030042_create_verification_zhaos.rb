class CreateVerificationZhaos < ActiveRecord::Migration
  def change
    create_table :verification_zhaos do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.references :industry, index: true, foreign_key: true
      t.string :image_url
      t.string :name
      t.string :short_name
      t.string :nature
      t.string :scale
      t.string :mobile
      t.string :website
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.text :introduction

      t.timestamps null: false
    end
  end
end
