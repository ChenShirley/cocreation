class Vote < ActiveRecord::Base
  attr_accessible :id, :marketability, :feasibility, :innovative, :name, :show, :user_id, :presub_id

  belongs_to :presub
  belongs_to :user

end
