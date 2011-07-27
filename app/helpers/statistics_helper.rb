module StatisticsHelper
  def selected_if_range_eq(range)
    range = range.to_s
    
    if params['range'].present? && params['range'] == range
      'class=selected'
    end
  end
end
