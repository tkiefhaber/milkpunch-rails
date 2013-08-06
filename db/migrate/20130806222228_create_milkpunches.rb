class CreateMilkpunches < ActiveRecord::Migration
  def change
    create_table :milkpunches do |t|
      t.string :boob, :null => false
      t.datetime :milkpunch, :null => false
      t.timestamps
    end
  end
end
