class ServicesController < ApplicationController  
  def index
    @services = Service.all
    
    respond_to do |format|
      format.json { render :json => @services }
    end
  end

  def show
    @service = Service.find(params[:id])
    
    respond_to do |format|
      format.json { render :json => @service }
    end
  end

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])    
    
    respond_to :js
  end

  def create
    @service = Service.new(params[:service])
    
    if @service.save
      @services = Service.where(:category_id => params[:service][:category_id])
    end
    
    respond_to :js
  end

  def update
    @service = Service.find(params[:id])
    
    if @service.update_attributes(params[:service])
      @services = Service.where(:category_id => params[:service][:category_id])
    end  
    
    respond_to :js
  end

  def destroy
    @service = Service.find(params[:id])    
    @service.destroy    
    
    respond_to :js
  end
end
