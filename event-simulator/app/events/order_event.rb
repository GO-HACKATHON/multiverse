class OrderEvent
  def gofood_order_booked
    {
      header: {
        event_name: 'gofood.order.booked',
        timestamp: current_timestamp
      },
      body: {
        location: Location.generate,
        order_id: sample_order_id,
        driver_id: sample_driver_id,
        customer_id: sample_customer_id,
        merchant_id: sample_merchant_id
      }
    }
  end

  def gofood_order_canceled
    {
      header: {
        event_name: 'gofood.order.canceled',
        timestamp: current_timestamp
      },
      body: {
        location: Location.generate,
        order_id: sample_order_id,
        customer_id: sample_customer_id,
        merchant_id: sample_merchant_id,
        reason: "waited.too.long"
      }
    }
  end

  private
  def sample_driver_id
    "driver-#{rand(1000...2000)}"
  end

  def sample_order_id
    "order-#{SecureRandom.hex(10)}"
  end

  def sample_customer_id
    "customer-#{rand(1000...2000)}"
  end

  def sample_merchant_id
    "merchant-#{rand(10...20)}"
  end
end
