class Story < ActiveRecord::Base
  attr_accessible :id, :topic, :history, :pro_id, :presub_id, :user_id, :send, :show
 
  belongs_to :user
  belongs_to :pro
end
