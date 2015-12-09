class AddDetailsAndAdvantagesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :details, :text
    add_column :jobs, :advantages, :string
  end
end
