class CategoriesController < ApplicationController
  def index
    @categories = Category.roots 
    
    handle_pjax
  end

  def show
    @category = Category.find(params[:id])
    @service = Service.new
    
    handle_pjax
  end

  def new
    if params[:parent_id].present?
      @parent_category = Category.find(params[:parent_id])
    end
    
    @category = Category.new(:parent_id => params[:parent_id])    
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to(@category, :notice => "Category was successfully created.")
    else
      render :action => "new"
    end
  end

  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      redirect_to(@category, :notice => "Category was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])    
    @category.destroy   
    
    respond_to :js
  end  
end
