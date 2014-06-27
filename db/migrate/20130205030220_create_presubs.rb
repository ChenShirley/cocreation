class CreatePresubs < ActiveRecord::Migration
  def change
    create_table :presubs do |t|
      t.string :name
      t.string :classify
      t.integer :goal
      t.text :intro
      t.text :summary
      t.text :pic
      t.text :video
      t.string :describe
			t.text :version
			t.integer :modify
      t.boolean :confirm
      t.boolean :teacheron

      t.references :user
      t.references :projectparam

      t.timestamps
    end
  end
end
