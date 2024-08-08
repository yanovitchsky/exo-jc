
# # EXO1
# class create_a_simple_class
  
# end

# # EXO2
# class add_attributes_with_attr_accessor
#   attr_accessor :first_name, :last_name

# end
 
# # EXO3
# class initialize_attributes
#   attr_accessor :first_name, :last_name

#   def initialize
#     @first_name = first_name
#     @last_name = last_name
#   end
# end

#EX20 : Using Modules for Shared Behavior, include a module in the class to add shared methods.
module Shared_behavior

  def behavior1()
    puts "EX20 : Behavior1"
  end
  def behavior2()
    puts "EX20 : Behavior2"
  end
end

# EXO1 : Define a basic class with no attributes or methods.
class Student
  #EX20 : Using Modules for Shared Behavior, include a module in the class to add shared methods.
  include Shared_behavior
  # EXO2 :Add attributes to the class using attr_accessor.
  # attr_accessor :name, :age
  
  #EXO8 : Use attr_reader and attr_writer for read-only and write-only attributes
  attr_reader :name, :age  # Setters
  attr_writer :name, :age  # Getters

  # EXO3 : Define an initialize method to set initial values for the attributes.
  def initialize(name, age)
    @name = name
    @age = age
  end
  # EXO4 : Create a method that uses the attributes in its implementation.
  def uses_the_attributes
    puts "Name : #{@name} and Age : #{@age} ans."
  end
  #EX06 : Define a method at the class level using self.
  def self.bonjour(name6,age6)
    @name6 = name6
    @age6 = age6
    puts "Bonjour #{@name6}, tu as #{@age6} ans."
  end
  #EXO7 : Add a method that modifies the attributes of an instance.
  def modifies_the_attributes_of_an_instance(name7,age7)
    @name7 = name + " Jr"
    @age7 = age - 10
    puts "Bonjour #{@name7}, tu as #{@age7} ans."
  end
  # EX09 : non demandé mais ajouté pour tester l'appel de la private method depuis l'intérieur de la class
  def call_private_method
    private_method
  end
  #EX09 : Add a method that can only be called within the class.
  private
  def private_method
    puts "Private method used"
  end
end

#EX10 : Inheritance : Create a subclass that inherits from the original class.
class Size < Student

  attr_accessor :height, :class_level, :hair_color, :hair_size
  #EX15 : Using attr_reader and attr_writer, create read-only and write-only attributes.
  attr_reader :hair_color15
  attr_writer :hair_size15

  #EX16 : Class Variables and Methods, use class variables to keep track of class-level data.
  # A REVOIR
  @@class_level = []

  #EX17 : Class Method with self, define a class method that provides information about the class.
  # A REVOIR
  def self.class_level(arg1, arg2, arg3, arg4)
    @@class_level = @@class_level.sum / @@class_level.size
    puts "La moyenne de la classe est de  : #{@@class_level}"
  end

  #EX12 : Define a constant within the class
  LEGAL_AGE = 18

  def height(height)
    @height = height
    puts "Bonjour #{name}, tu as #{@age} ans et tu mesures #{@height}m."
  end
  # EX11 : Override a method in the subclass to change its behavior.
  def modifies_the_attributes_of_an_instance(name,age)
    @name = name + " Sr"
    @age = age + 50
    puts "Bonjour #{@name},tu as #{@age} ans."
  end

  #EX13 : Differentiate between class methods and instance methods using self.
  def self.weight(weight)
    @weight = weight
    puts "Ton poids est de #{@weight}kg."
  end

  #EX18 : Instance Variables, use instance variables to store object-specific data.
  def hair_color(hair_color)
    @hair_color = hair_color
    puts "La couleur de tes cheveux est #{@hair_color}."
  end
  def hair_size(hair_size)
    @hair_size = hair_size
    puts "La taille de tes cheveux est de #{@hair_size}cm."
  end
end



# EXO5 : Instantiate an object of the class and call its method.
# people1 = Student.new("John",19)
# people2 = Student.new("Tom",23)
# people1.uses_the_attributes
# people2.uses_the_attributes


#EX06 : Define a method at the class level using self.
# Remarque pas besoin de créer une instance avant d'appeler la méthode lorsque l'on utilise une méthode de classe
# Student.bonjour("Jack",36)

#EX07 : Add a method that modifies the attributes of an instance.
# people7 = Student.new("Tom",23)
# people7.modifies_the_attributes_of_an_instance("Tom",23)

#EX08 : Use attr_reader and attr_writer for read-only and write-only attributes
# people2 = Student.new("Tom",23)
# people2.uses_the_attributes
# people7 = Student.new("Tom",23)
# people7.modifies_the_attributes_of_an_instance("Tom",23)

#EX09 : Add a method that can only be called within the class.
# people9 = Student.new("Tom",23)
# people9.private_method #On ne peut pas appeler une private method depuis l'extérieur de la class
# people9.call_private_method

#EX10 : Create a subclass that inherits from the original class.
# people10 = Size.new("Tom",23)
# people10.height(1.75)

# #EX11 : Override a method in the subclass to change its behavior
# people10 = Size.new("Tom",23)
# people10.modifies_the_attributes_of_an_instance("Tom",23)

# #EX13 : Differentiate between class methods and instance methods using self.
# # Method d'instance : on doit créer 1 instance 
# people10 = Size.new("Tom",23)
# # Avant d'appeler la méthode sur l'instance
# people10.height(1.69)
# # Weight est une méthode de class donc on peut l'appeler directement via sa class, sans avoir a créer d'instance
# Size.weight(65)

#EX17 : Class Method with self, define a class method that provides information about the class.

#EX18 : Instance Variables, use instance variables to store object-specific data.
# people18 = Student.new("John",19)
# Student.bonjour("Jack",25)
# people18.modifies_the_attributes_of_an_instance("Jack",25)

#EX19 : Creating Multiple Instances, instantiate multiple objects and use their methods.
# people18 = Student.new("John",19)
# Student.bonjour("Jack",25)
# people18.modifies_the_attributes_of_an_instance("Jack",25)

# people19 = Size.new("Tom",23)
# Size.weight(65)
# people19.hair_color("noire")
# people19.hair_size(5)

#EX20 : Using Modules for Shared Behavior, include a module in the class to add shared methods.
# people21 = Student.new("Peter",31)
# people22 = Size.new("tosh",32)
# people21.behavior1
# people21.behavior2
