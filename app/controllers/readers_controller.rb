class ReadersController < ApplicationController
  
  def index
    @readers = Reader.all
  end
  
  def new
    @reader = Reader.new
  end
  
  def create
    @reader = Reader.new(params[:reader].permit[:name, :start_time])
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
