class CommentsController < ApplicationController  
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save 
      @comments = Comment.where(:patient_id => params[:comment][:patient_id]).order("created_at desc")
    end
    
    respond_to :js
  end
  
  def destroy
    @comment = Comment.find(params[:id])    
    @comment.destroy
    
    respond_to :js
  end
end
