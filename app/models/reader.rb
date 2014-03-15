class Reader < ActiveRecord::Base
  has_many :messages
  has_many :tags, through: :messages
  
  validates :name, presence: true, uniqueness: true
  validates :start_time, presence: true

  def tags_waiting
    self.tags.where(active: true).distinct
  end
end
