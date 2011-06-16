class LineItemsController < ApplicationController
  def index
    @line_item = LineItem.all
    
    respond_to do |format|
      format.json { render :json => @line_item }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])
    @line_item.name = @line_item.service.name
    @line_item.price = @line_item.service.price
    
    respond_to do |format|
      format.json { render :json => @line_item }
    end
  end
  
  def create
    @appointment = Appointment.find(params[:line_item][:appointment_id])
    service = Service.find(params[:line_item][:service_id])
    @line_item = @appointment.add_service(service.id)
    
    respond_to do |format|
      if @line_item.save
        format.json { render :json => @line_item }
      end
    end
  end
  
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.json  { head :ok }
    end
  end
end
