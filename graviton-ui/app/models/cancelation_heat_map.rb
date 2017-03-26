class CancelationHeatMap
  
  class << self
    
    def get_data opts = {}
      range_data = opts["time_range"]
      case range_data
        when "minutly"
          return data_per_minute
        when "hourly"
          return data_per_hour
        when "daily"
          return data_per_day
      end
    end
    
    
    private
    
    
      def hourly_base_key
        return Time.current.strftime("hourlyorder.canceled:%Y%m%d")
      end
      
      def minutly_base_key
        return Time.now.strftime("minutelyorder.canceled:%Y%m%d%H")
      end
      
      def daily_base_key
        return Time.now.strftime("dailyorder.canceled:%Y%m")
      end
      
      def data_per_minute
        key = Aerospike::Key.new("test", "event", minutly_base_key)
        data = GravitonUi.aerospike.get(key)
        
        current_minute = Time.now.strftime("%M")
        coordinate_data = data.bins[current_minute].map do |coordinate|
          JSON.parse(coordinate)
        end
        return coordinate_data
      end
      
      def data_per_hour
        key = Aerospike::Key.new("test", "event", hourly_base_key)
        data = GravitonUi.aerospike.get(key)
        
        current_hour = Time.now.strftime("%H")
        
        coordinate_data = data.bins["08"].map do |coordinate|
          JSON.parse(coordinate)
        end
        return coordinate_data
      end
      
      def data_per_day
        key = Aerospike::Key.new("test", "event", daily_base_key)
        data = GravitonUi.aerospike.get(key)
        
        current_day = Time.now.strftime("%d")
        
        coordinate_data = data.bins[current_day].map do |coordinate|
          JSON.parse(coordinate)
        end
        return coordinate_data
      end
  end
end