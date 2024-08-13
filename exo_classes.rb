# 09/08/2024
# [1] Create some products with names, prices, and stock quantities
class Product

  attr_accessor :name, :price, :stock, :quantity

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end
# [2] Create a customer with a name
class Customer # La classe Customer est responsable de représenter un client et ses attributs, y compris son panier.
  attr_accessor :customer_name, :cart

  def initialize(customer_name)
    @customer_name = customer_name
    @cart = Cart.new(self)  # Crée un panier pour ce client
  # @cart est une variable d’instance de la classe Customer. Les variables d’instance sont spécifiques à chaque instance d’une classe.
	# @cart va stocker l’objet Cart (le panier d’achat) qui sera créé pour le client.
  # Cart.new appelle le constructeur de la classe Cart, ce qui crée une nouvelle instance de Cart.
	# (self) est utilisé pour passer une référence à l’objet actuel 
  # (dans ce cas, l’objet Customer qui est en train d’être initialisé) au constructeur de la classe Cart.
  end

  def add_product(name, quantity)
    @cart.add_product(name, quantity)
    # @cart est une variable d’instance qui fait référence à l’objet Cart associé à un client (Customer). 
    # Ce panier contient les produits que le client souhaite acheter.
	  # add_product : C’est une méthode définie dans la classe Cart qui permet d’ajouter un produit au panier.
  end
end
# [3] Add products to the customer's cart
class Cart # La classe Cart, quant à elle, est responsable de gérer les produits dans le panier.

  attr_accessor :items

  def initialize(customer)
    @customer = customer
    @items = [] 
    # @items est une variable d’instance de la classe Cart. 
    # @items Elle est un tableau qui contient les produits ajoutés au panier. 
  end

  def add_product(product, quantity)
    @items << { product: product, quantity: quantity }
    # Chaque élément du tableau (@items) est un hash qui contient deux clés :
	  # :product : qui fait référence à l’objet Product.
	  # :quantity : qui stocke la quantité de ce produit dans le panier.
    puts "#{quantity} #{product.name}(s) added to your cart."
  end
# [4] Checkout the cart and display the total price
  def checkout
    total_price = @items.sum { |item| item[:product].price * item[:quantity] }
    # -> @items est une variable d’instance de la classe Cart qui contient une liste de produits ajoutés
    #  au panier. Chaque élément de cette liste est un hash avec deux clés : 
    #  :product, qui fait référence à l’objet Product, 
    #  et :quantity, qui représente la quantité de ce produit ajouté au panier.
    #  -> .sum est une méthode de Ruby qui additionne tous les éléments d’une collection. 
    #  Ici, elle est utilisée pour calculer la somme totale des prix des produits dans le panier.
    #  -> Bloc { |item| ... } Ce bloc est exécuté pour chaque élément de @items.
	  # item représente un élément de la collection @items, c’est-à-dire un hash contenant un produit et sa quantité.

  total_price = total_price.round(1)
    puts "Checking out for #{@customer.customer_name}..."
    puts "Total price: $#{total_price}"
    # clear_cart  # A dé-comenter si on veut avoir TRUE à [5] Ensure the cart is clear after checkout
    total_price
  end
# [5] Ensure the cart is clear after checkout
  def clear_cart
    @items.clear
  end
end

# [6] Create an order from the cart, process payment, and ship the order
class Order
  def initialize(customer, cart)
    @customer = customer
    # Duplique les items du panier pour les stocker dans une variable d'instance @cart_items
    # La méthode .dup est utilisée ici pour créer une copie de la liste des items, 
    # ce qui évite que des modifications sur @cart_items n'affectent l'original cart.items.
    @cart_items = cart.items.dup
    
    # Calcule le total du panier en appelant la méthode checkout sur l'objet cart
    # et stocke le résultat dans une variable d'instance @total_price
    @total_price = cart.checkout
  end

  def process_payment
    puts "Payment processed. Thank you for your order!"
  end

  def ship_order
    puts "Order shipped. It will arrive soon!"
  end
end

# [1] Create some products with names, prices, and stock quantities
apple = Product.new("Apple", 1.2, 10)
banana = Product.new("Banana", 0.5, 20)
orange = Product.new("Orange", 0.8, 15)

# [2] Create a customer with a name
john = Customer.new("John Doe")

# [3] Add products to the customer's cart
john.add_product(apple, 3)  
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
# # # => "Payment processed. Thank you for your order!"

order.ship_order
# => "Order shipped. It will arrive soon!"