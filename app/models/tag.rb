class Tag < ActiveRecord::Base
  has_many :messages
  
  validates :category, presence: true , inclusion: {in: %w(basket cart)}
  validates :start_time, presence: true
  
end
