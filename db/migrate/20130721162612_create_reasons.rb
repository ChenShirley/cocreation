class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :context
      
      t.references :user
      t.references :presub

      t.timestamps
    end
  end
end
