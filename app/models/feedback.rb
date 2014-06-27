class Feedback < ActiveRecord::Base
  attr_accessible :money, :plan, :limit, :amount, :investamount,:projectparam_id, :user_id, :presub_id, :pro_id
  belongs_to :user
  belongs_to :projectparam
	belongs_to :presub
	belongs_to :pro
end
