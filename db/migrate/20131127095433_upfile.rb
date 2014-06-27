class Upfile < ActiveRecord::Migration
  def change
    create_table :upfiles do |t|
			t.string :filename
			t.string :filetoken
			t.string :filetype
			t.string :size
			t.string :usage
      t.boolean :currentuse

      t.references :user
      t.references :projectparam
      t.references :presub

      t.timestamps
    end
  end
end
