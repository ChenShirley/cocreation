class AddUpfileToPresubs < ActiveRecord::Migration
  def change
    add_column :presubs, :upfile_id, :integer
  end
end
