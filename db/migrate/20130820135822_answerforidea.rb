class Answerforidea < ActiveRecord::Migration
  def change
    create_table :answerforideas do |t|

      t.string :name
      t.string :context
      
      t.references :questionforidea

      t.timestamps
    end
  end
end
