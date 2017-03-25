class OrderEvent
  def gofood_order_booked
    {
      header: {
        event_name: 'gofood.order.booked',
        timestamp: '2017-02-03T10:17:40.392Z'
      },
      body: {
        location: [-6.178005,106.7881563],
        order_id: 'order-123',
        driver_id: 'D12323',
        customer_id: 'C1234123',
        merchant_id: 'M0001'
      }
    }
  end

  def gofood_order_canceled
    {
      header: {
        event_name: 'gofood.order.canceled',
        timestamp: '2017-02-03T10:17:40.392Z'
      },
      body: {
        location: [-6.178005,106.7881563],
        order_id: 'order-123',
        customer_id: 'C1234123',
        merchant_id: 'M0001',
        reason: "waited.too.long"
      }
    }
  end
end
