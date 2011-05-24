class TemplatesController < ApplicationController
  before_filter :hide_sidebar, :only => [ :new, :edit ]
  
  def index
    @templates = Template.all    
  end
  
  def new
    @template = Template.new    
  end

  def edit
    @template = Template.find(params[:id])    
  end

  def create
    @template = Template.new(params[:template])
    
    if @template.save
      redirect_to(templates_url, :flash => { :updated_id => @template.id }, :notice => "Tempate was successfully created.")
    else
      render :action => "name"
    end
  end

  def update
    @template = Template.find(params[:id])
    
    if @template.update_attributes(params[:template])
      redirect_to(templates_url, :flash => { :updated_id => @template.id }, :notice => "Template was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @template = Template.find(params[:id])
    
    if @template.destroy
      redirect_to(templates_url)
    end
  end  
  
  private
  
    def hide_sidebar 
      @without_sidebar = true    
    end
end
