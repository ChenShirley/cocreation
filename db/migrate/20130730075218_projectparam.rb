class Projectparam < ActiveRecord::Migration
  def change
    create_table :projectparams do |t|
      t.integer :mentor_id
      t.integer :keeper1_id
      t.integer :keeper2_id
      t.string :mentor_email
      t.string :keeper1_email
      t.string :keeper2_email
      t.string :due0 
      t.string :due1
      t.string :due2
      t.string :due3
      t.integer :nowstage
      t.integer :restday0
      t.integer :restday1
      t.integer :restday2
      t.integer :restday3

      t.references :user
      
      t.timestamps
    end
  end
end
