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
  
end
