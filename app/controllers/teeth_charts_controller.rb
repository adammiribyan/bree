class TeethChartsController < ApplicationController
  def update
    @teeth_chart = TeethChart.find(params[:id])   
    @teeth_chart.update_attributes(params[:teeth_chart])
    
    respond_to :js
  end

end
