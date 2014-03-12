class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(params[:tag].permit[:type, :start_time]) # set :active to false
    if @tag.save
      redirect_to action: 'index', status: :found, notice: "New Tag Created!"
    else
      render 'new'
    end
  end
  
  def enter
    @tag = Tag.find(params[:id])
    if @tag.active == true
      # write error that the tag is already active
    else
      @tag.active = true
      @tag.save
      render 'index'
    end
  end
  
  def leave
    @tag = Tag.find(params[:id])
    if @tag.active == false
      # write error that the tag is already not active
    else
      @tag.active = false
      @tag.save
      render 'index'
    end
  end
  
end
