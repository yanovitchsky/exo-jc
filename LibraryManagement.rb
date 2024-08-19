# Contexte : Gestion d’une Bibliothèque

# Vous devez créer un système pour gérer les emprunts de livres dans une bibliothèque. 
# Le système doit permettre les opérations suivantes :

# 1. Création de Livres :

# 	•	Créez des livres avec un titre, un auteur, et un nombre d’exemplaires disponibles.

# 2. Création de Membres :

# 	•	Créez des membres avec un nom et un identifiant unique (ID).

# 3. Gestion des Emprunts :

# 	•	Les membres doivent pouvoir emprunter un livre pour une durée spécifiée.
# 	•	Lorsqu’un emprunt est effectué, il doit être associé au membre et au livre.
# 	•	Un livre ne peut être emprunté que s’il y a des exemplaires disponibles.
# 	•	Chaque emprunt doit avoir une date de retour prévue, et il doit être possible de vérifier 
#   si un emprunt est en retard.

# 4. Retour des Livres :

# 	•	Les membres doivent pouvoir retourner un livre, et le nombre d’exemplaires disponibles doit être mis à jour.
# 	•	Si un livre est retourné après la date de retour prévue, un message doit indiquer que le livre est en retard.

# 5. Historique des Emprunts :

# 	•	Chaque membre doit pouvoir consulter l’historique de ses emprunts, avec les dates d’emprunt 
#   et de retour pour chaque livre.

# 6. Exemple d’Utilisation :

# 	•	Créez des livres et des membres.
# 	•	Effectuez des emprunts pour les membres.
# 	•	Vérifiez la disponibilité des livres avant de faire un emprunt.
# 	•	Gérez le retour des livres et affichez les messages pour les livres en retard.
# 	•	Affichez l’historique des emprunts pour un membre.

# Concepts à Apprendre :

# 	1.	Gestion des quantités : Apprenez à gérer le nombre d’exemplaires d’un livre et à mettre à jour 
#   cette quantité lors des emprunts et des retours.
# 	2.	Gestion du temps : Travaillez avec les dates pour calculer les délais de retour 
#   et déterminer si un emprunt est en retard.
# 	3.	Historique des transactions : Apprenez à stocker et afficher un historique des actions réalisées 
#   par un utilisateur.

# Ce système est plus complexe que le précédent car il intègre la gestion du temps, la gestion des quantités,
#  et l’historique des transactions. Il vous permettra d’apprendre à manipuler 
#  des collections d’objets plus complexes, ainsi qu’à gérer des données temporelles.

# LibraryManagement.rb

# Gemme nécessaire pour la gestion de la base de données
require 'active_record'

# Configuration de la connexion à la base de données SQLite3
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'library.db'
)

# 1. Création de la table `books` dans la base de données
class CreateBooksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :copies_available

      t.timestamps
    end
  end
end

# 2. Création de la table `members` dans la base de données
class CreateMembersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :user_id

      t.timestamps
    end
  end
end

# 3. Création de la table `borrowings` pour gérer les emprunts
class CreateBorrowingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :borrowings do |t|
      t.references :member, foreign_key: true
      t.references :book, foreign_key: true
      t.date :borrowing_date
      t.date :return_date

      t.timestamps
    end
  end
end

# Exécution des migrations pour créer les tables
CreateBooksTable.new.change
CreateMembersTable.new.change
CreateBorrowingsTable.new.change

# 1. Modèle pour la classe `Books` :
# Ce modèle représente un livre et mappe les attributs à la table `books`.
class Book < ActiveRecord::Base
  has_many :borrowings # Relation avec les emprunts (un livre peut avoir plusieurs emprunts)

  # Méthode pour afficher un message confirmant la création du livre.
  def book_creation
    puts "Le livre dont le titre est '#{title}', l'auteur est '#{author}', est disponible en #{copies_available} exemplaires, a été créé."
  end
end

# 2. Modèle pour la classe `Member` :
# Ce modèle représente un membre et mappe les attributs à la table `members`.
class Member < ActiveRecord::Base
  has_many :borrowings # Relation avec les emprunts (un membre peut avoir plusieurs emprunts)

  # Méthode pour afficher un message confirmant la création du membre.
  def member_creation
    puts "Le membre dont le nom est '#{name}' et l'identifiant unique (ID) est '#{user_id}' a été créé."
  end
end

# 3. Modèle pour la classe `BorrowingManagement` :
# Ce modèle représente un emprunt et mappe les attributs à la table `borrowings`.
class Borrowing < ActiveRecord::Base
  belongs_to :member # Chaque emprunt est associé à un membre
  belongs_to :book   # Chaque emprunt est associé à un livre

  # Méthode pour effectuer un emprunt de livre par un membre pour une durée spécifiée.
  def self.book_borrowing(member, book, loan_duration)
    if book.copies_available > 0
      book.update(copies_available: book.copies_available - 1)
      borrowing = Borrowing.create(
        member: member,
        book: book,
        borrowing_date: Date.today,
        return_date: Date.today + loan_duration
      )
      puts "#{member.name} a emprunté le livre '#{book.title}' pour #{loan_duration} jours. Date de retour prévue : #{borrowing.return_date}."
    else
      puts "Le livre '#{book.title}' n'est plus disponible."
    end
  end

  # Méthode pour vérifier si un emprunt est en retard.
  def loan_is_overdue?
    Date.today > return_date
  end

  # 4. Retour des Livres :
  # Méthode pour gérer le retour d'un livre par un membre.
  def return_of_the_books
    book.update(copies_available: book.copies_available + 1)
    if loan_is_overdue?
      puts "Le livre '#{book.title}' a été retourné en retard par #{member.name}."
    else
      puts "#{member.name} a retourné le livre '#{book.title}' à temps."
    end
  end

  # 5. Historique des Emprunts :
  # Méthode pour afficher l'historique des emprunts d'un membre.
  def self.borrowing_history(member)
    borrowings = Borrowing.where(member: member)
    puts "Historique des emprunts pour #{member.name}:"
    borrowings.each do |borrowing|
      puts "Livre: '#{borrowing.book.title}', Date d'emprunt: #{borrowing.borrowing_date}, Date de retour prévue: #{borrowing.return_date}"
    end
  end
end

# Exemple d'utilisation :
# 1. Création de Livres :
book1 = Book.create(title: "Tenet", author: "Christopher NOLAN", copies_available: 3)
book1.book_creation

# 2. Création de Membres :
member1 = Member.create(name: "John DOE", user_id: "id4321")
member1.member_creation

# 3. Gestion des Emprunts :
Borrowing.book_borrowing(member1, book1, 14)

# 4. Retour des Livres :
borrowing1 = Borrowing.first
borrowing1.return_of_the_books

# 5. Historique des Emprunts :
Borrowing.borrowing_history(member1)

# Explications :

# 	1.	ActiveRecord et Base de Données :
# 	•	ActiveRecord est une bibliothèque qui fournit une interface pour interagir avec 
# 	une base de données relationnelle. Ici, nous utilisons SQLite3, une base de données légère, 
# 	pour stocker les informations sur les livres, les membres et les emprunts.
# 	•	Les classes Book, Member, et Borrowing héritent de ActiveRecord::Base, ce qui les lie directement 
# 	aux tables correspondantes dans la base de données.
# 	2.	Migrations :
# 	•	Les classes CreateBooksTable, CreateMembersTable, et CreateBorrowingsTable sont des migrations 
# 	qui définissent la structure des tables dans la base de données.
# 	•	Elles sont exécutées pour créer les tables nécessaires.
# 	3.	Relations entre les Modèles :
# 	•	Book et Member sont en relation has_many avec Borrowing, ce qui signifie qu’un livre ou un membre peut
# 	 avoir plusieurs emprunts.
# 	•	Borrowing est en relation belongs_to avec Book et Member, ce qui signifie que chaque emprunt est lié 
# 	à un seul livre et un seul membre.
# 	4.	Méthodes Modifiées :
# 	•	Les méthodes qui manipulaient directement les attributs des objets (book_borrowing, return_of_the_books,
# 	 etc.) utilisent désormais ActiveRecord pour manipuler les données en base de données.
# 	•	Par exemple, pour réduire le nombre d’exemplaires disponibles d’un livre, nous utilisons 
# 	book.update(copies_available: book.copies_available - 1).
# 	5.	Historique des Emprunts :
# 	•	L’historique des emprunts est récupéré depuis la base de données via Borrowing.where(member: member)
# 	 et affiche les informations pertinentes.

# Cette version du système utilise une base de données pour stocker toutes les informations nécessaires,
#  ce qui permet une gestion plus robuste et pérenne des emprunts, des membres, et des livres dans la bibliothèque.