# Vous devez créer un système pour gérer les réservations de salles de conférence dans un hôtel. Le système doit permettre les opérations suivantes :
# 	1.	Création de Salles :
# 	•	Créez des salles de conférence avec un nom et une capacité.
# 	2.	Création de Clients :
# 	•	Créez des clients avec un nom.
# 	3.	Réservations :
# 	•	Les clients doivent pouvoir réserver une salle pour une date et une durée spécifiques.
# 	•	Lorsqu’une réservation est faite, elle doit être associée à la salle et au client.
# 	4.	Gestion des Réservations :
# 	•	Chaque salle doit pouvoir vérifier si elle est disponible pour une date et une durée spécifiques.
# 	•	Les salles doivent pouvoir libérer toutes leurs réservations après l’utilisation.
# 	5.	Exemple d’Utilisation :
# 	•	Créez des salles de conférence et des clients.
# 	•	Faites des réservations pour les clients.
# 	•	Vérifiez la disponibilité des salles avant de faire une réservation.
# 	•	Assurez-vous que les réservations sont correctement gérées et que les salles sont libérées après l’utilisation.

class ConferenceRoomManagement
  attr_accessor :room_name, :capacity, :reservations

  # Initialisation d'une salle de conférence avec un nom et une capacité
  def initialize(room_name, capacity)
    @room_name = room_name
    @capacity = capacity
    @reservations = [] # Liste des réservations pour cette salle
  end

  # Affiche un message confirmant la création de la salle de conférence
  def conference_room_creation
    puts "Création de la salle #{@room_name} ayant une capacité de #{@capacity} places."
  end

  # Vérifie si la salle est disponible pour une date et une durée spécifiques
  def available?(date, duration)
    # La méthode none? passe à travers chaque élément de @reservations 
    # et vérifie si aucun élément ne satisfait la condition donnée dans le bloc.
    @reservations.none? do |reservation|
      reservation.date == date && reservation.duration == duration
    end
  end

  # Libère toutes les réservations après l'utilisation
  def clear_reservations
    @reservations.clear
    puts "Toutes les réservations pour la salle #{@room_name} ont été libérées."
  end

  # Ajoute une réservation à la liste des réservations de la salle
  def add_reservation(reservation)
    @reservations << reservation
  end
end

class Customer
  attr_accessor :customer_name

  # Initialisation d'un client avec un nom
  def initialize(customer_name)
    @customer_name = customer_name
  end

  # Affiche un message confirmant la création du client
  def customer_creation
    puts "Création du client #{ @customer_name}."
  end

  # Permet à un client de réserver une salle pour une date et une durée spécifiques
  def customer_reservation(room, date, duration)
    if room.available?(date, duration)
      # Création de la réservation avec le nom du client, la salle, la date et la durée
      reservation = Reservation.new(@customer_name, room, date, duration)
      room.add_reservation(reservation)
      puts "Réservation effectuée, pour le client #{@customer_name}, dans la salle #{room.room_name}, le #{date} pour #{duration} heure(s)."
    else
      puts "La salle #{room.room_name}, n'est pas disponible, pour le #{date}, pendant #{duration} heure(s)."
    end
  end
end

class Reservation
  attr_accessor :customer_name, :room, :date, :duration

  # Initialisation d'une réservation avec le nom du client, la salle, la date et la durée
  def initialize(customer_name, room, date, duration)
    @customer_name = customer_name
    @room = room
    @date = date
    @duration = duration
  end
end

# 5. Exemple d'utilisation :

# 1. Création de Salles :
# • Créez des salles de conférence avec un nom et une capacité.
salleN1 = ConferenceRoomManagement.new("Salle N1", 100)
salleN1.conference_room_creation

salleN2 = ConferenceRoomManagement.new("Salle N2", 200)
salleN2.conference_room_creation

salleN3 = ConferenceRoomManagement.new("Salle N3", 300)
salleN3.conference_room_creation

# 2. Création de Clients :
# • Créez des clients avec un nom.
client1 = Customer.new("John DOE")
client1.customer_creation

client2 = Customer.new("Jane DOE")
client2.customer_creation

# 3. Réservations :
# • Les clients doivent pouvoir réserver une salle pour une date et une durée spécifiques.
client1.customer_reservation(salleN1, "2024-08-20", 2)
client2.customer_reservation(salleN2, "2024-08-20", 3)

# 4. Gestion des Réservations :
# • Vérifiez la disponibilité des salles avant de faire une réservation.
client1.customer_reservation(salleN1, "2024-08-20", 2) # Cette réservation échouera car la salle est déjà réservée

# • Libérez toutes les réservations après l’utilisation.
salleN1.clear_reservations
client1.customer_reservation(salleN1, "2024-08-20", 2) # Cette fois, la réservation fonctionnera

# Mettre un point d’interrogation ? à la fin d’une méthode en Ruby est une convention utilisée 
# pour indiquer que la méthode retourne un booléen (true ou false). Cependant, il est important de comprendre que
# cela n’impose pas automatiquement à la méthode de retourner un booléen. 
# Le point d’interrogation est simplement un indice pour le développeur, et c’est à vous de faire en sorte 
# que la méthode retourne effectivement un booléen.
# Exemple 1 : Méthode avec ? qui retourne un booléen
#     def valid_age?(age)
#       age >= 18
#     end
# Exemple 2 : Méthode avec ? qui ne retourne pas un booléen
#     def age?(age)
#      age + 5
#     end
# Cette méthode age? a un point d’interrogation dans son nom, mais elle retourne un entier, pas un booléen.
# C’est un exemple de mauvais usage de la convention, car cela pourrait prêter à confusion.