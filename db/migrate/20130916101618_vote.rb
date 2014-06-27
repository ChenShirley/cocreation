class Vote < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.string :name
      t.boolean :show
      t.string :marketability
      t.string :feasibility
      t.string :innovative

      t.references :user
      t.references :presub

      t.timestamps
    end
  end
end
