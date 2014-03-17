class ReadersController < ApplicationController
  
  def index
      @readers = Reader.all
      @opened = Reader.where(working: true)
      @messages = Message.all
      tags = Tag.all
      @counter = Array.new
      @opened.each do |o|
        @counter[o.id] = 0
        tags.each do |t|
          if t.active == true
            reading = @messages.where(tag_id: t.id).order(:created_at).last
            if o.id == reading.reader_id
              @counter[o.id] += 1
            end
          end
        end
      end
    end
  
  
  def new
    @reader = Reader.new
  end
  
  def create
    @reader = Reader.new(params[:reader].permit(:name, :start_time))
    if @reader.save
      redirect_to action: 'index', status: :found, notice: "New Reader Created!"
    else
      render 'new'
    end
  end
  
  def open
    @reader = Reader.find(params[:id])
    if @reader.working == true
      redirect_to action: 'index', notice: 'Reader is already active'
    else
      @reader.working = true
      @reader.save
      render 'index'
    end
  end
  
  def close
    @reader = Reader.find(params[:id])
    if @reader.working == false
      redirect_to action: 'index', notice: 'Reader is already inactive'
    else
      @reader.working = false
      @reader.save
      render 'index'
    end
  end
  
  
end
