class Tag < ActiveRecord::Base
  has_many :messages
  
  validates :type, presence: true
  validates :start_time, presence: true
  
end
