class StatisticsController < ApplicationController
  def index
    unless params[:range]
      redirect_to range: "week"
    else      
      @range = Statistics::Range.new(params[:range]) if params[:range]
    end
  end

end
