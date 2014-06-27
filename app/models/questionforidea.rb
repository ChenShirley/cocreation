class Questionforidea < ActiveRecord::Base
  attr_accessible :id, :name, :show, :context, :user_id, :presub_id

  has_many :answerforideas, :dependent => :destroy
  belongs_to :presub
  belongs_to :user
end
