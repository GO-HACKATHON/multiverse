class DriverEvent

  def driver_active_on_location
    {
      header: {
        event_name: 'driver.active.on.location',
        timestamp: current_timestamp
      },
      body: {
        location: Location.generate,
        driver_id: sample_driver_id
      }
    }
  end

  def driver_idle_on_location
    {
      header: {
        event_name: 'driver.idle.on.location',
        timestamp: current_timestamp
      },
      body: {
        location: Location.generate,
        driver_id: sample_driver_id
      }
    }
  end

  private

  def current_timestamp
    Time.now.utc.to_i
  end

  def sample_driver_id
    "driver-#{rand(1000...2000)}"
  end

end
