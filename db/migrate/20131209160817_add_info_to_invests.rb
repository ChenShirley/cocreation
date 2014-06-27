class AddInfoToInvests < ActiveRecord::Migration
  def change
    add_column :investments, :delivername, :string
    add_column :investments, :delivermail, :string
    add_column :investments, :deliverphone, :string
    add_column :investments, :deliveraddress, :string
    add_column :investments, :memo, :string
  end
end
