class Message < ActiveRecord::Base
  belongs_to :tag
  belongs_to :reader
  
  validates :reader_id, presence: true
  validates :tag_id, presence: true
  validates :activity, inclusion: {in: %w(in out)}
  
  def bla()
    @variable = self.tag.where(active: true).order(:created_at).last
    @variable.reader_id
  end
end
