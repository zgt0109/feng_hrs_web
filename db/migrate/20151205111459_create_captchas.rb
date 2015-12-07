class CreateCaptchas < ActiveRecord::Migration
  def change
    create_table :captchas do |t|
      t.string :mobile
      t.string :code
      t.datetime :send_at

      t.timestamps null: false
    end
  end
end
