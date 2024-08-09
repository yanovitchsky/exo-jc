# Exo du 30/07/2024
#EXO A6
def hash_initialization_and_access
    hash = { name: "john", age: 30 , city: "Madrid" }
		puts "EXO A6 : Create a hash with keys name, age, and city:"
		puts hash
		puts "EXO A6 : print the value associated with the name key :"
    puts hash [:name]
end
#hash_initialization_and_access()

#EXO A7
def hash_addition_and_deletion
		puts "EXO A7 : Create a hash with keys name, age, and city:"
    hash = { name: "john", age: 30 , city: "Whashington DC" }
    puts hash

    hash[:country] = "USA"
		puts "EXO A7 : Add a new key-value pair to the hash (country: USA) "
    puts hash

		puts "EXO A7 : Remove the age key : "
    hash.delete(:age)
    puts hash
end
#hash_addition_and_deletion()

#EXO A8
def iterating_over_a_hash
    hash = { USA: "Washington DC", Germany: "Berlin", Suisse: "Berne", Spain: "Madrid"}
    # hash.each {|key, value| puts "#{"%3d" % value} => #{key}" }
    hash.each {|key, value| puts "#{key} : #{value}"}
end
#iterating_over_a_hash

#EXO A9
def hash_merge
    hash1 = { name: 'john', age: 30 }
    hash2 = { country: 'USA', capital:'Washington DC' }
    hash3 = hash1.merge(hash2)
    puts " hash1 : #{hash1}"
    puts " hash2 : #{hash2}"
    puts " hash3 : #{hash3}"
end
#hash_merge()

#EXO A10
def hash_keys_and_values
    hash = { name: 'john', age: 30 , city: 'London' }
    # hash.each {|key, value| puts "#{"%3d" % value} => #{key}" }
    hash.each{ |key, value| puts "key:#{key}" } 
    hash.each{ |key, value| puts "value:#{value}" } 
end
#hash_keys_and_values()

#######################
## EXO du 31/07/2024 ##
#######################

#EXO B1 V1
# def array_of_hashes_with_nested_arrays
#     students = [
#       { name: "Anna", age: 21, grades: [14, 12, 9, 5] },
#       { name: "Paul", age: 22, grades: [19, 5, 4, 12] },
#       { name: "Olga", age: 23, grades: [16, 5, 12, 7] },
#       { name: "Jack", age: 24, grades: [8, 4, 16, 12] }
#     ]
#     #def calculate_average_grade(grades)
#     #average_grade = grades.sum.to_f / grades.size
#     #end

    students.each do |student|
      # average_grade = calculate_average_grade(student[:grades])
			average_grade = student[:grades].sum / student[:grades].size.to_f
      # puts "EXO 1 : Average grade for  #{student[:name]} est #{average_grade.round(2)}"
      average_grade
    end
end

#array_of_hashes_with_nested_arrays()

#EXO B2 V1
def nested_data_structures_manipulation
	people = [
		{person: { name: "Anna", age: 21}, hobbies: ["foot", "basket", "judo"] },
		{person: { name: "Paul", age: 22}, hobbies: ["foot", "reading", "chess"] },
		{person: { name: "Olga", age: 23}, hobbies: ["reading", "basket", "judo"] },
		{person: { name: "Jack", age: 24}, hobbies: ["reading", "basket", "judo"] }
  ]

  # Utiliser `select` pour filtrer les personnes ayant "reading" comme passe-temps
	# Création d'un nouveau tableau contenant que les personnes ayant reading comme hobby
  people_reading_hobby = people.select do |person|
    person[:hobbies].include?("reading")
  end
  # Déf méthode .each permet de parcourir chaque élément de la collection tableau/Hash/Objet
  # Le bloc de code : Le code entre do et end est exécuté pour chaque élément du tableau.
  # |number| : Entre les barres verticales, nous définissons une variable (ici number) qui représente l’élément courant du tableau.
	# puts number : Affiche la valeur de number.

  # •	Tableau : numbers = [1, 2, 3, 4, 5]
	# •	Méthode .each : numbers.each parcourt chaque élément du tableau numbers.
	# •	Bloc de code : Le code entre do et end est exécuté pour chaque élément du tableau.
	# •	|number| : Entre les barres verticales, nous définissons une variable (ici number) qui représente l’élément courant du tableau.
	# •	puts number : Affiche la valeur de number.

  # Afficher les noms des personnes ayant "reading" comme passe-temps
  # puts "EXO 2 : People who have “reading” as a hobby :"
  # people_reading_hobby.each do |person|
  #   puts person[:person][:name]
  # end
  people_reading_hobby
end

print nested_data_structures_manipulation


#EXO B2 V2
# def nested_data_structures_manipulation
#     student = [
#       {person: { name: "Anna", age: 21}, hobies: ["foot", "basket", "judo"] },
#       {person: { name: "Paul", age: 22}, hobies: ["foot", "reading", "chess"] },
#       {person: { name: "Olga", age: 23}, hobies: ["reading", "basket", "judo"] },
#       {person: { name: "Jack", age: 24}, hobies: ["reading", "basket", "judo"] }
#     ]
# 		def reading_as_hobby_test(hobies)
# 			reading_as_hobby_result = hobies.include?("reading")
# 		end
					
# 		student.each do |student|
# 			reading_as_hobby_result = reading_as_hobby_test(student[:hobies])
#         if reading_as_hobby_result == true
#           puts "EXO 2 : The name of people who have “reading” as a hobby is : #{student[:person][:name]}"
#         end
# 		end
# end

# def nested_data_structures_manipulation_refactor
#   student = [
#     {person: { name: "Anna", age: 21}, hobies: ["foot", "basket", "judo"] },
#     {person: { name: "Paul", age: 22}, hobies: ["foot", "reading", "chess"] },
#     {person: { name: "Olga", age: 23}, hobies: ["reading", "basket", "judo"] },
#     {person: { name: "Jack", age: 24}, hobies: ["reading", "basket", "judo"] }
#   ]

  
# end
#nested_data_structures_manipulation()

#EXO B3 
def complex_data_filtering
	orders = [
    {id: 1, customer_name: "Anna", items: [{product_name: "product1", quantity: 5}, {product_name: "product2", quantity: 15}]},
    {id: 2, customer_name: "Paul", items: [{product_name: "product2", quantity: 10}]},
    {id: 3, customer_name: "Olga", items: [{product_name: "product3", quantity: 25}]},
    {id: 4, customer_name: "Jack", items: [{product_name: "product4", quantity: 2}]}
  ]
	# La méthode select est utilisée pour filtrer les commandes
	#	Le bloc de code passé à select itère sur chaque order (sur chaque élément du hash orders)
  quantity_superior_at_10 = orders.select do |order|
		# Pour chaque order, la méthode any? est utilisée sur order[:items] 
		# la méthode any? est utilisée en Ruby pour déterminer 
		# si au moins un élément d’une collection satisfait une certaine condition
    order[:items].any? do |item|
			# ici, pour vérifier si au moins un item a une quantity supérieure à 10
      item[:quantity] > 10
    end
  end
  # La méthode .each parcourir les éléments d’une collection, comme un tableau (array) ou un hash. 
  # Elle permet d’itérer sur chaque élément de la collection et d’exécuter un bloc de code pour chaque élément.
	# La méthode each est utilisée pour itérer sur quantity_superior_at_10
	# quantity_superior_at_10 contient maintenant les commandes où au moins un article a une quantité > 10
  # quantity_superior_at_10.each do |order|
	# 	puts "EXO 3 : orders where at least one item has a quantity greater than 10 : "
  #   puts "Order ID: #{order[:id]}, Customer Name: #{order[:customer_name]}"
  # end
  # quantity_superior_at_10
end

#complex_data_filtering()

#EXO B4
def hash_of_arrays_of_hashes
	departments = {
		department_A: [{name: "John",salary: 25000},{name: "Olga",salary: 55000}],
		department_B: [{name: "Jack",salary: 33000},{name: "Anna",salary: 75000}],
		department_C: [{name: "Vera",salary: 40000},{name: "Paul",salary: 99000}],
	}

  # Parcourir chaque département
  departments.each do |department_name, employees|
    # Méthode utilisée pour parcourir chaque élément d’un hash ou d’un tableau. 
    # Dans ce cas, elle parcourt chaque paire clé(department_name) / valeur(employees) dans le hash departments.

    # Calculer le salaire total pour chaque département
    # La méthode .reduce est une méthode d’énumération qui prend un argument initial (dans ce cas, 0) et un bloc.
    # L’argument initial (0) sert de valeur de départ pour l’accumulation
    # Le bloc prend deux paramètres : sum et employee
	  # sum est l’accumulateur qui garde la somme courante des salaires
	  # employee est l’élément actuel du tableau employees (c’est-à-dire un hash représentant un employé)

    # employees : C’est le tableau des employés dans un département.
    # 0 : C’est la valeur initiale de l’accumulateur sum. Cela signifie que sum commence à 0.
    # sum : C’est l’accumulateur qui commence à 0 et s’accumule à chaque itération.
	  # employee : C’est l’élément courant du tableau employees, qui est un hash représentant un employé.
    # La méthode .reduce prend un tableau d’employés et accumule leurs salaires en partant de 0.
    total_salary = employees.reduce(0) do |sum, employee|
      sum + employee[:salary]
    end
    hash[department_name] = total_salary
    
    # Afficher le salaire total pour chaque département
    # puts "EXO 4 : Total salary for #{department_name}: #{total_salary} euros"
    total_salary
  end
  # hash
end

#hash_of_arrays_of_hashes()

#EXO B5
def advanced_data_grouping
	transactions = [
		{date: 2001,amount: 1000 , category: "CategoryA"},
		{date: 2002,amount: 2000 , category: "CategoryB"},
    {date: 2003,amount: 3000 , category: "CategoryC"},
    {date: 2004,amount: 4000 , category: "CategoryA"},
    {date: 2005,amount: 5000 , category: "CategoryB"},
    {date: 2006,amount: 6000 , category: "CategoryC"}
	]
  # Regrouper les transactions par catégorie
  # La méthode .group_by est utilisée pour regrouper les éléments d’une collection en fonction
  # du résultat d’un bloc de code
  # Elle retourne un hash où chaque clé est le résultat du bloc 
  # et chaque valeur est un tableau des éléments qui ont produit ce résultat
  grouped_transactions = transactions.group_by { |transaction| transaction[:category] }

  # Calculer le montant total dépensé dans chaque catégorie
  # La méthode .map est utilisée pour transformer les éléments d’une collection 
  # en appliquant un bloc de code à chaque élément, 
  # et en retournant une nouvelle collection avec les résultats du bloc
  total_amounts_by_category = grouped_transactions.map do |category, transactions|
    # La méthode .reduce est une méthode d’énumération qui prend un argument initial (dans ce cas, 0) et un bloc.
    # L’argument initial (0) sert de valeur de départ pour l’accumulation
    # Le bloc prend deux paramètres : sum et transaction
	  # sum est l’accumulateur qui garde la somme courante des transactions
	  # transaction est l’élément actuel du tableau transactions (c’est-à-dire un hash représentant une transaction)
    total_amount = transactions.reduce(0) { |sum, transaction| sum + transaction[:amount] }
    { category: category, total_amount: total_amount }
  end
  # Afficher les résultats
	puts "EXO 5 : Total amount spent in each category"
  total_amounts_by_category.each do |category_total|
    puts "#{category_total[:category]} : Total Amount: #{category_total[:total_amount]} euros."
  	end
end


#advanced_data_grouping()

#EXO B6
def transforming_nested_data_structures
  users = {
    1 => { name: "John", emails: ["John@example.com", "John@work.com"] },
    2 => { name: "Olga", emails: ["Olga@example.com", "Olga@work.com"] },
    3 => { name: "Jack", emails: ["jack@example.com", "jack@work.com"] },
    4 => { name: "Anna", emails: ["Anna@example.com", "Anna@work.com"] }
  }

  # Transformation du hash 'users' en un tableau de hashes avec les clés :user_id, :name et :primary_email
  transformed_users = users.map do |user_id, user_info|
    {
      user_id: user_id,                   # Prend l'ID de l'utilisateur
      name: user_info[:name],             # Prend le nom de l'utilisateur
      primary_email: user_info[:emails].first # Prend le premier email de la liste des emails
    }
  end
	puts "EXO6 : Create an array of hashes with keys user_id, name, and primary_email (the first email in the emails array: "
  # Parcourt et affiche chaque utilisateur transformé
  transformed_users.each do |user|
    puts "User ID: #{user[:user_id]}, Name: #{user[:name]}, Primary Email: #{user[:primary_email]}"
  end
end

#transforming_nested_data_structures()

#EXO 7
def data_aggregation_and_transformation
		products = [
			{name: "Product A", category: "categoryA", price: 100},
			{name: "Product B", category: "categoryA", price: 200},
			{name: "Product C", category: "categoryB", price: 300},
			{name: "Product D", category: "categoryB", price: 400},
			{name: "Product E", category: "categoryC", price: 500},
			{name: "Product F", category: "categoryC", price: 600}
		]
		# Grouper les produits par catégorie
		grouped_products = products.group_by { |product| product[:category] }
		# Transformer le hash groupé en triant les produits par prix dans chaque catégorie
		transformed_products = grouped_products.transform_values do |products|
      # Trier les produits par prix décroissant
			res = products.sort_by { |product| -product[:price] }.map { |product| product[:name] }
		end
		puts "EXO 7 : Create a hash where keys are categories and values are arrays of product names sorted by price in descending order :"
		transformed_products.each do |category, product_names|
			puts "Category: #{category}, Products: #{product_names.join(', ')}"
		end
end

#data_aggregation_and_transformation()

#EXO B8
def flattening_nested_arrays_and_hashes
  # Définition d'un tableau de hashes représentant des cours avec leurs étudiants et notes
  courses = [
    {
      course_name: "Math 101",
      students: [
        {name: "Alice", grade: "A"},
        {name: "Bob", grade: "B"}
      ]
    },
    {
      course_name: "History 202",
      students: [
        {name: "Charlie", grade: "B"},
        {name: "David", grade: "A"}
      ]
    },
    {
      course_name: "Biology 303",
      students: [
        {name: "Eve", grade: "C"},
        {name: "Frank", grade: "B"}
      ]
    }
  ]

  # La méthode .flat_map est utilisée en Ruby pour transformer un tableau 
  # en aplatissant les résultats d’un bloc. Elle combine deux opérations en une seule : 
  # map (qui transforme les éléments d’un tableau) 
  # et flatten (qui aplatit le résultat en un tableau unidimensionnel)

  # Retourner le tableau aplanie
  # Utiliser .flat_map pour transformer un tableau de cours avec des étudiants en un tableau aplati de hashes
  flattened_array = courses.flat_map do |course|
    # Pour chaque cours, on parcourt les étudiants
    course[:students].map do |student|
      {
        course_name: course[:course_name],
        student_name: student[:name],
        grade: student[:grade]
      }
    end
  end
  puts "EXO 8 : Flatten this structure to create an array of hashes with keys course_name, student_name, and grade : #{flattened_array}"
end

# Résultat : 
# [{:course_name=>"Math 101", :student_name=>"Alice", :grade=>"A"},
#  {:course_name=>"Math 101", :student_name=>"Bob", :grade=>"B"}, 
#  {:course_name=>"History 202", :student_name=>"Charlie", :grade=>"B"},
#   {:course_name=>"History 202", :student_name=>"David", :grade=>"A"},
#    {:course_name=>"Biology 303", :student_name=>"Eve", :grade=>"C"}, 
#    {:course_name=>"Biology 303", :student_name=>"Frank", :grade=>"B"}]


flattening_nested_arrays_and_hashes()


#EXO B9
def advanced_data_merging
  # Given two arrays of hashes representing employees ([{id, name, department}] and [{id, salary}])
  employees = [
    {id: 1, name: "Alice", department: "Engineering"},
    {id: 2, name: "Bob", department: "HR"},
    {id: 3, name: "Charlie", department: "Marketing"}
  ]
  
  salaries = [
    {id: 1, salary: 70000},
    {id: 2, salary: 50000},
    {id: 3, salary: 60000}
  ]
  
  def merge_employee_data(employees, salaries)
    # Créer un hash indexé par id pour les salaires
    # salaries.each_with_object({}) do |salary, hash| itère sur chaque élément de salaries, 
    # où salary est l’élément actuel de l’itération et hash est l’objet que nous construisons
	  # Pour chaque élément salary dans salaries, nous ajoutons une entrée dans hash où la clé est salary[:id]
    # et la valeur est salary[:salary].
	  # Ainsi, nous construisons un hash salary_by_id qui associe les IDs des employés à leurs salaires.
    salary_by_id = salaries.each_with_object({}) do |salary, hash|
      hash[salary[:id]] = salary[:salary]
      # Pendant l’itération :
	    # Premier élément :
	    # salary = {id: 1, salary: 70000}
	    # hash = {1 => 70000}
	    # Deuxième élément :
    	# salary = {id: 2, salary: 50000}
    	# hash = {1 => 70000, 2 => 50000}
    	# Troisième élément :
    	# salary = {id: 3, salary: 60000}
    	# hash = {1 => 70000, 2 => 50000, 3 => 60000}
      # Après l’itération :
      # salary_by_id = {1 => 70000, 2 => 50000, 3 => 60000}
    end
  
    # Parcourir le tableau des employés et ajouter le salaire correspondant
    merged_data = employees.map do |employee|
      {
        id: employee[:id],
        name: employee[:name],
        department: employee[:department],
        salary: salary_by_id[employee[:id]]
      }
    end
  
    merged_data
    puts "Test : #{merged_data}"
  end

  # Appeler la méthode et afficher le résultat
  merged_employees = merge_employee_data(employees, salaries)
  puts "EXO 9 : Merge 2 arrays of hashes representing employees into a single array of hashes with keys id, name, department, and salary : "

  merged_employees.each do |employee|
    puts "ID: #{employee[:id]}, Name: #{employee[:name]}, Department: #{employee[:department]}, Salary: #{employee[:salary]}"
  end
end

# advanced_data_merging()

#EXO B10
def data_structure_validation(books)
  # Utiliser un set pour suivre les titres uniques

  # Description : Set.new crée un nouvel ensemble (set) vide. 
  # Un ensemble est une collection d’éléments uniques, ce qui signifie qu’un élément ne peut apparaître
  # qu’une seule fois dans un ensemble.

	# Utilisation : Dans ce code, Set.new est utilisé pour initialiser un ensemble vide
  # qui servira à stocker les titres des livres de manière à garantir leur unicité.
  titles = Set.new

  books.each_with_index do |book, index|
    title = book[:title]
    genres = book[:genres]

    # Vérifier si le titre est unique
    # Description : La méthode include? est utilisée pour vérifier si un ensemble 
    # (ou un tableau, ou une chaîne de caractères) contient un certain élément.
	  #Utilisation : Ici, titles.include?(title) vérifie si le titre du livre actuel est déjà présent
    #  dans l’ensemble titles. Si c’est le cas, cela signifie qu’il y a un titre dupliqué.
    if titles.include?(title)
      puts "EXO 10A : Error: Duplicate title '#{title}' found for book at index #{index}."
    else
      titles.add(title)
      puts "EXO 10B : Titre ajouté : #{title}"
    end

    # Vérifier si le livre a au moins un genre
    if genres.nil? || genres.empty?
      puts "EXO 10C : Error: Book '#{title}' at index #{index} has no genres."
    end
  end
end

# Exemple d'utilisation
books = [
  {title: "titre1", author: "author1", year: 2001, genres: ["comedy", "Fiction"]},
  {title: "titre2", author: "author2", year: 2002, genres: ["adventure", "drama"]},
  {title: "titre3", author: "author3", year: 2003, genres: []},
  {title: "titre4", author: "author4", year: 2004, genres: ["drama"]},
  {title: "titre1", author: "author5", year: 2005, genres: ["adventure"]},
  {title: "titre6", author: "author6", year: 2006, genres: ["comedy", "thriller"]},
]
# Appeler la méthode de validation
# data_structure_validation(books)

# print nested_data_structures_manipulation
# print array_of_hashes_with_nested_arrays
# print complex_data_filtering
# print hash_of_arrays_of_hashes
print data_aggregation_and_transformation