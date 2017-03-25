class DriverEvent
  def driver_active_on_location
    {
      header: {
        event_name: 'driver.active.on.location',
        timestamp: '2017-02-03T10:17:40.392Z'
      },
      body: {
        location: [-6.178005,106.7881563],
        driver_id: 'D12323'
      }
    }
  end

  def driver_idle_on_location
    {
      header: {
        event_name: 'driver.idle.on.location',
        timestamp: '2017-02-03T10:17:40.392Z'
      },
      body: {
        location: [-6.178005,106.7881563],
        driver_id: 'D12323'
      }
    }
  end

end
