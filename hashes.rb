def hash_initialization_and_access
    hash = { name: 'john', age: 30 , city: 'Madrid' }
    puts hash [:name]
end

def hash_addition_and_deletion
    hash = { name: 'john', age: 30 , city: 'Madrid' }
    puts hash
    # Add a new key-value pair to the hash (country: "USA") 
    hash[:country] = "Spain"
    puts hash
    # remove the age key
    hash.delete(:age)
    puts hash
end

def iterating_over_a_hash
    hash = { USA: "Washington DC", Germany: "Berlin", Suisse: "Berne", Spain: "Madrid"}
    # hash.each {|key, value| puts "#{"%3d" % value} => #{key}" }
    hash.each {|key, value| puts "#{key} : #{value}"}
end

def hash_merge
    hash1 = { name: 'john', age: 30 }
    hash2 = { country: 'USA', capital:'Washington DC' }
    hash3 = hash1.merge(hash2)
    puts " hash1 : #{hash1}"
    puts " hash2 : #{hash2}"
    puts " hash3 : #{hash3}"
end

def hash_keys_and_values
    hash = { name: 'john', age: 30 , city: 'London' }
    # hash.each {|key, value| puts "#{"%3d" % value} => #{key}" }
    hash.each{ |key, value| puts "key:#{key}" } 
    hash.each{ |key, value| puts "value:#{value}" } 
end

hash_initialization_and_access()
hash_addition_and_deletion()
iterating_over_a_hash()
hash_merge() 
hash_keys_and_values() 
