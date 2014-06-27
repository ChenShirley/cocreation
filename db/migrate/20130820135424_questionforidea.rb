class Questionforidea < ActiveRecord::Migration
  def change
    create_table :questionforideas do |t|

      t.string :name
      t.boolean :show
      t.string :context

      t.references :user
      t.references :presub

      t.timestamps
    end
  end
end
