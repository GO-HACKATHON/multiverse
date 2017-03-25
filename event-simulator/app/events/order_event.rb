class OrderEvent
  def order_picked_up
    {
      header: {
        event_name: 'order.picked_up',
        timestamp: '2017-02-03T10:17:40.392Z'
      },
      body: {
        lat: '171.09',
        lang: '12.142',
        order_id: 'order-123',
        driver_id: 'D12323',
        customer_id: 'C1234123'
      }
    }
  end
end
