class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|

      t.integer :howmuch
      t.boolean :confirm
      t.boolean :showname
      t.boolean :showemail
			t.boolean :remit
			t.string :account_name
      t.integer :account_num
			t.string :time
      t.integer :feedback_id

      t.references :user
      t.references :pro

      t.timestamps
    end
  end
end
