class LineItemsController < ApplicationController
  def create
    @appointment = Appointment.find(params[:appointment_id])
    service = Service.find(params[:service_id])
    @line_item = @appointment.line_items.build(:service => service)
    
    respond_to do |format|
      if @line_item.save
        ormat.json { render :json => @line_item }
      end
    end
  end
end
