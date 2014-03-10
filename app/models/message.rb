class Message < ActiveRecord::Base
  belongs_to :tag
  belongs_to :reader
  
  validates :reader_id, presence: true
  validates :tag_id, presence: true
  validates :message_time, presence: true
  validates :activity, inclusion: {in: %w(IN OUT)}
end
