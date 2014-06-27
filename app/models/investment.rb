class Investment < ActiveRecord::Base
  attr_accessible :id, :howmuch, :confirm, :user_id, :pro_id, :feedback_id, :showname, :showemail, :remit, :account_name, :account_num, :time, :delivername, :delivermail, :deliverphone, :deliveraddress, :memo, :bank
	validates_presence_of :bank, :time, :account_name, :account_num
  belongs_to :user
  belongs_to :pro
end
