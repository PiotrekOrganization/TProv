require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "create_order_with_short_name" do
  	order = Order.new
  	order.name = 'Test'
  	order.quantity = 123
  	order.ticket_time = 5000
  	order.price = 123
  	assert !order.save
  end

	test "create_valid_order" do
  	order = Order.new
  	order.name = 'Lorem lorem lorem test ipsum'
  	order.quantity = 123
  	order.ticket_time = 5000
  	order.price = 123
  	assert order.save
  end

  test "create_order_with_low_ticket_time" do
  	order = Order.new
  	order.name = 'Lorem lorem lorem test ipsum'
  	order.quantity = 123
  	order.ticket_time = 300
  	order.price = 123
  	assert !order.save
  end

  test "create_order_without_quantity" do
  	order = Order.new
  	order.name = 'Lorem lorem lorem test ipsum'
  	order.ticket_time = 9999
  	order.price = 123
  	assert !order.save
  end

  test "create_valid_order_without_price" do
  	order = Order.new
  	order.name = 'Lorem lorem lorem test ipsum'
  	order.quantity = 123
  	order.ticket_time = 5000
  	assert !order.save
  end

  test "create_valid_order_without_name" do
  	order = Order.new
  	order.quantity = 123
  	order.ticket_time = 5000
  	assert !order.save
  end

end
