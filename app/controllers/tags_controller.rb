class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
    @readers = Reader.where(working: true)
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(params[:tag].permit(:category, :start_time))
    if @tag.save
      redirect_to action: 'index', status: :found, notice: "New Tag Created!"
    else
      render 'new'
    end
  end
  
  def enter
    @reader = Reader.find(params[:reader_id])
    @tag = Tag.find(params[:id])
    if @tag.active == true
      redirect_to action: 'index', notice: 'Tag is already active'
    else
      @tag.active = true
      @tag.save
      @reader.messages.create(tag_id: @tag.id, activity: 'in')
      redirect_to action: 'index'
    end
  end
  
  def leave
    @reader = Reader.find(params[:reader_id])
    @tag = Tag.find(params[:id])
    if @tag.active == false
      redirect_to action: 'index', notice: 'Tag is already inactive'
    else
      @tag.active = false
      @tag.save
      @reader.messages.create(tag_id: @tag.id, activity: 'out')
      redirect_to action: 'index'
    end
  end
  
end
