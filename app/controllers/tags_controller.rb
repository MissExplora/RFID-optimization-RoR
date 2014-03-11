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
  end
  
  def leave
  end
  
end
