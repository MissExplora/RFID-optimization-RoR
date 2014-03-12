class ReadersController < ApplicationController
  
  def index
    @readers = Reader.all
  end
  
  def new
    @reader = Reader.new
  end
  
  def create
    @reader = Reader.new(params[:tag].permit[:name, :start_time, :working])
    if @reader.save
      redirect_to action: 'index', status: :found, notice: "New Reader Created!"
    else
      render 'new'
    end
  end
  
  def open
    @reader = Reader.find(params[:id])
    if @reader.working == true
      # write error that the reader is already active
    else
      @reader.working = true
      @reader.save
      render 'index'
    end
  end
  
  def close
    @reader = Reader.find(params[:id])
    if @reader.working == false
      # write error that the reader is already not active
    else
      @reader.working = false
      @reader.save
      render 'index'
    end
  end
  
end
