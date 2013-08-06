class MilkpunchesAddColumnUserId < ActiveRecord::Migration
  def change
  	add_column :milkpunches, :user_id, :integer
  end
end
