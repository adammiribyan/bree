class LineItemsController < ApplicationController
  def index
    @line_item = LineItem.find_by_appointment_id(params[:appointment_id])
    
    respond_to do |format|
      format.json { render :json => @line_item.to_json(:methods => [ :name, :price ]) }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])
    
    respond_to do |format|
      format.json { render :json => @line_item.to_json(:methods => [ :name, :price ]) }
    end
  end
  
  def create
    @appointment = Appointment.find(params[:line_item][:appointment_id])
    service = Service.find(params[:line_item][:service_id])
    @line_item = @appointment.add_service(service.id)
    
    respond_to do |format|
      if @line_item.save
        format.json { render :json => @line_item.to_json(:methods => [ :name, :price ]) }
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
