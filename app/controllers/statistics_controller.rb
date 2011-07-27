class StatisticsController < ApplicationController
  def index
    @range = Statistics::Range.new(params[:range]) if params[:range]
  end

end
