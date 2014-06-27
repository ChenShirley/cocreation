class CreatePros < ActiveRecord::Migration
  def change
    create_table :pros do |t|
      t.string :classify
      t.integer :got
      t.string :start 
      t.boolean :teacheron
      t.boolean :resultletter

      t.references :user
      t.references :presub

      t.timestamps
    end
  end
end
