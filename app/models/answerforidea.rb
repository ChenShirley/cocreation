class Answerforidea < ActiveRecord::Base
  attr_accessible :context, :name, :questionforidea_id

  belongs_to :questionforidea
end
