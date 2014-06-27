class Feedback < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :projectparam_id
      t.integer :user_id
      t.integer :presub_id
      t.integer :pro_id
      t.integer :money
      t.string :plan
			t.boolean :limit
      t.integer :amount
      t.integer :investamount, :default => 0

      t.references :user
      t.references :projectparam
      t.references :presub

      t.timestamps
    end
  end
end
