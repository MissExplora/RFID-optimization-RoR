class Reader < ActiveRecord::Base
  has_many :messages
  has_many :tags, through: :messages
  
  validates :name, presence: true, uniqueness: true
  validates :start_time, presence: true

  def tags_waiting
    @messages = Message.all
    @tags = Tag.all
    counter = 0
    @tags.each do |t|
      if t.active == true
        @reading = messages.find_by(tag_id: t.id).order(:created_at).last
        if self.id == @reading.reader_id
          counter = counter+1
        end
      end
    end
    return counter
  end
  
  
end
