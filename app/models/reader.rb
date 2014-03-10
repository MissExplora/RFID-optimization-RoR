class Reader < ActiveRecord::Base
  has_many :messages
  
  validates :name, presence: true, uniqueness: true
  validates :start_time, presence: true
end
