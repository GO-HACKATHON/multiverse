require 'spec_helper'

describe 'OrderEvent' do
  describe "#order_picked_up" do
    it 'returns sample order_picked_up event' do
      order = OrderEvent.new
      expect(order.order_picked_up.class).to eq(Hash)
    end
  end
end
