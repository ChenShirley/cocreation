class AddBankToInvests < ActiveRecord::Migration
  def change
    add_column :investments, :bank, :string
  end
end
