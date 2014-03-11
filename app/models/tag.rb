class Tag < ActiveRecord::Base
  before_save :default_values
  
  has_many :messages
  
  validates :type, presence: true #, inclusion: {in: %w(basket cart)}
  validates :start_time, presence: true
  
  def default_values # change this somehow
    # self.active ||= false
  end
  
end
