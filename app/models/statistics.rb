module Statistics
  class Range
    RANGES = {
      today: "Date.today",
      tomorrow: "Date.tomorrow",
      week: "1.week.ago..Date.today",
      month: "1.month.ago..Date.today",
      quarter: "3.months.ago..Date.today",
      year: "1.year.ago..Date.today"
    }
    
    def initialize(range = "today")
      @range = RANGES[range.to_sym]
    end
    
    def interval
      class_eval @range
    end
            
    class << self
      RANGES.each do |method_name, range|
        define_method(method_name.to_s) do
          instance_eval range
        end
      end
    end
  end  
end
