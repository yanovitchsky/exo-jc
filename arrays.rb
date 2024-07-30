def array_initialization_and_access()
		array = [2,3,5,7,11]
    puts array[2]
end

def array_insertion_and_deletion
	array = [2,3,5,7,11]
	array << 13
	puts array	
	# array.shift
	array = array.drop(1)
	puts array	
end

def iterating_over_an_array
    favorite_fruits = ["mango","banaba","papaya","pineapple","watermelon"]
    favorite_fruits.each do |fruit|
        puts fruit
    end
end

def array_map
		array = [2,3,4,5,6]
		array_squares = array.map! {|num| num ** 2}
=begin
		array_squares = []
		array.each do |number|
			number_square = number ** 2
			array_squares << number_square
		end
=end
		puts array_squares
end

def array_select
	array = [2,3,5,8,11]
	#puts array.select(&:even?)
	# array.each { |x| puts x if x.even? }
	array.each { |x| puts x if x % 2 == 0 }
end

array_initialization_and_access()
array_insertion_and_deletion()
iterating_over_an_array()
array_map()
array_select()

