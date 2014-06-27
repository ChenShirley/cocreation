class Upfile < ActiveRecord::Base
  include ActiveModel::Validations
attr_accessible :filename, :filetoken, :filetype, :size, :usage, :currentuse, :user_id, :projectparam_id, :presub_id
  belongs_to :user
  belongs_to :projectparam
  belongs_to :presub
end