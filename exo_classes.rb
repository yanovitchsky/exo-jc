# [1] Create some products with names, prices, and stock quantities
apple = Product.new("Apple", 1.2, 10)
banana = Product.new("Banana", 0.5, 20)
orange = Product.new("Orange", 0.8, 15)

# [2] Create a customer with a name
john = Customer.new("John Doe")

# [3] Add products to the customer's cart
john.cart.add_product(apple, 3)    # Add 3 Apples
# => "3 Apple(s) added to your cart."
john.cart.add_product(banana, 5)   # Add 5 Bananas
# => "5 Banana(s) added to your cart."
john.cart.add_product(orange, 2)   # Add 2 Oranges
# => "2 Orange(s) added to your cart."

# [4] Checkout the cart and display the total price
john.cart.checkout
# => "Checking out for John Doe..."
# => "Total price: $7.1"

# [5] Ensure the cart is clear after checkout
puts "Cart is clear: #{john.cart.items.empty?}"   # Should output true
# => "Cart is clear: true"

# [6] Create an order from the cart, process payment, and ship the order
order = Order.new(john, john.cart)
# => "Checking out for John Doe..."
# => "Total price: $7.1"

order.process_payment
# => "Payment processed. Thank you for your order!"

order.ship_order
# => "Order shipped. It will arrive soon!"