class Projectparam < ActiveRecord::Base
  attr_accessible :id, :user_id, :mentor_id, :keeper1_id, :keeper2_id, :mentor_email, :keeper1_email, :keeper2_email, :due0, :due1, :due2, :due3, :nowstage, :restday0, :restday1, :restday2, :restday3, :members_attributes
	validates_presence_of :mentor_email, :case_sensitive => false 
	validates_presence_of :keeper1_email, :case_sensitive => false
	validates_presence_of :keeper2_email, :case_sensitive => false
	validates_presence_of :due0, :due1, :due2, :due3
  belongs_to :user
  has_one :presub, :dependent => :destroy
	has_many :members, :dependent => :destroy
  accepts_nested_attributes_for :members, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
end
