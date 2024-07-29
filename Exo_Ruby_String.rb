=begin
class Chaine

    attr_accessor :chaine1, :chaine2


    def initialize(chaine1, chaine2)
        @chaine1 = chaine1
        @chaine2 = chaine2
    end

    # Exo 1 : OK
    def anagram (chaine1, chaine2)
            @chaine1 = chaine1
            @chaine2 = chaine2
            if
                @chaine1.chars.sort == @chaine2.chars.sort
                puts "Exo 1 : function that checks if two strings are anagrams : TRUE"
            elsif
                @chaine1.chars.sort != @chaine2.chars.sort
                puts "Exo 1 : function that checks if two strings are anagrams : FALSE"
            else
                puts "Exo 1 : problème...merci de voir le code"
            end
        end

end


chaine1 = Chaine.new("silent", "listen")
chaine1.anagram("silent", "listen")
chaine1.anagram("silent", "total")

=end

=begin
class Chaine

    attr_accessor :chaine1

    def initialize(chaine1)
        @chaine1 = chaine1
    end

        # EXO 2B : OK
        # REMARQUE mettre argument dans le constructeur
        def stringCompression(chaine)
            chaine = chaine.downcase.to_s
            hash = Hash.new(0)
            chaine.each_char do |char|
              hash[char] += 1
            end
          
            hash.each do |key, value|
              #puts "#{key}#{value}" if value > 1
            @hash = hash.map{|k,v| "#{k}#{v}"}.join('')
            end
            puts "Exo 2 : stringCompression : #{@hash}"
        end
end

chaine2 = Chaine.new("silent")
chaine2.stringCompression("aaabbbbcccccddeeeefffjjjhhhhaaaaa")
=end

=begin
class Chaine

    attr_accessor :chaine1

    def initialize(chaine1)
        @chaine1 = chaine1
    end

        # EXO 3 : OK
        def stringDecompression(chaine)
            # Transforme string en array
            @chaine = chaine.chars
            tab = []
            i = 0
            # parcourir array jusqu'à array.length

            @chaine.each do |c|
            # i += 1
            # count += 1
            @c = c
                # si caractère = lettre
                if @c =~ /[A-Za-z]/
                    # stock variable c dans variable l <=> letter
                    @l = @c
                    # affiche caractère lettre
                    puts "#{@l}"
                    
                    # si caractère = chiffre
                elsif @c =~ /[0-9]/
                    # Transforme c en integer
                    @c = c.to_i
                    # stock variable c dans variable d <=> digit
                    # (caractère - 1) 
                    @d = @c - 1
                # affiche d fois la lettre précédente l
                    @d.times do puts "#{@l}"
                end
                end
                
            end

        end

end

chaine3 = Chaine.new("silent")
chaine3.stringDecompression("a2b3c4")

=end
=begin
class Chaine

    attr_accessor :chaine1

    def initialize(chaine1)
        @chaine1 = chaine1
    end
       
            @i = 0
            # while @i <= chaine.length
            chaine.each_char { |c| #puts c
                
            if c.match?(/[[:digit:]]/)
                a = c.to_i
                b = a - 1 

                #@i = 2
                #while @i <= @c
                #@i += 1
                puts c * b
                # end
            elsif c.match?(/[[:alpha:]]/)
                puts c
            end
         }

            #puts "Exo 3 : stringDecompression : #{@hash}"
        end
end


chaine3 = Chaine.new("silent")
chaine3.stringDecompression("a3b3c3")
=end
=begin
    # EXO 4 : OK
    class Chaine

        attr_accessor :chaine1, :chaine2, :i, :count
    
        def initialize(chaine1)
            @chaine1 = chaine1
        end

    def longestSubstringWithoutRepeatingCharacters(chaine)
            arr = []
            words = []
            a=chaine
            b=a
            a.length.times do
              b.chars.each do |char|
                break if arr.include? char
                arr << char
              end
              words << arr.join
              arr.clear
              b=b.chars.drop(1).join
            end
            
            puts words.map(&:chars).max_by(&:length).join               
    end

end

chaine4 = Chaine.new("silent")
chaine4.longestSubstringWithoutRepeatingCharacters("abcabcbb")

=end
=begin
    class Chaine

        attr_accessor :chaine1
    
        def initialize(chaine1)
            @chaine1 = chaine1
        end

    # EXO 5 : OK
    def stringPermutations(chaine)
        chaine = chaine.downcase.to_s
        @chaine5 = chaine.chars.permutation.map &:join
        puts "Exo 5 : String Permutations : #{@chaine5}"
    end

end

chaine5 = Chaine.new("abc")
chaine5.stringPermutations("abc")    

=end
=begin
    class Chaine

        attr_accessor :chaine1, :chaine2
    
        def initialize(chaine1,chaine2)
            @chaine1 = chaine1
            @chaine2 = chaine2
        end

    # EXO 6 : OK
    def reverseWordsInString(chaine1, chaine2)
        chaine1 = chaine1.downcase.to_s
        chaine2 = chaine2.downcase.to_s
        @chaine1 = chaine1.reverse
        @chaine2 = chaine2.reverse
        puts "Exo 6 : Reverse Words in a String : #{@chaine1}, #{@chaine2}"
    end

end

chaine6 = Chaine.new("Hello", "word")
chaine6.reverseWordsInString("Hello", "word")    

=end
=begin
    class Chaine

        attr_accessor :chaine1, :chaine2
    
        def initialize(chaine1,chaine2)
            @chaine1 = chaine1
            @chaine2 = chaine2
        end

    # EXO 7 : OK mais A REVOIR
    def findAllIndicesOfASubstringInAString(str,target)
        # avant @a = chaine.enum_for(:scan,/#/).map { Regexp.last_match.begin(0) }
        sz = target.size
        @a = (0..str.size-sz).select { |i| str[i,sz] == target }

        puts "Exo 7 : findAllIndicesOfASubstringInAString : #{@a}"
    end

end

chaine7 = Chaine.new("silent","toto")   
chaine7.findAllIndicesOfASubstringInAString("abracadabra","abra")  

=end
=begin
    class Chaine

        attr_accessor :chaine1, :chaine2
    
        def initialize(chaine1)
            @chaine1 = chaine1
            @chaine2 = chaine2
        end

    # EXO 8 : OK
    def canStringRearrangedToPalindrome (chaine)
        str=chaine
        arr=str.split("").uniq
        single=0
        odd=0
        arr.each do |x|
            single +=1 if str.count(x)==1
            odd +=1 if (str.count(x)).odd?
        end
            if single > 1
                puts "EXO 8A : canStringRearrangedToPalindrome : FALSE" 
            elsif odd > 1 
                puts "EXO 8B : canStringRearrangedToPalindrome : FALSE"
            else 
                puts "EXO 8C : canStringRearrangedToPalindrome : TRUE"
            end
    end

end

chaine8 = Chaine.new("hello")
chaine8.canStringRearrangedToPalindrome("civic")
chaine8.canStringRearrangedToPalindrome("Hello")

=end
=begin
    class Chaine

        attr_accessor :chaine1, :chaine2
    
        def initialize(chaine1,chaine2)
            @chaine1 = chaine1
            @chaine2 = chaine2
        end

    # EXO 9 : OK
    def stringRotation (chaine1, chaine2)
        @chaine1 = chaine1
        @chaine2 = chaine2.reverse
        if @chaine1 == @chaine2
            puts "Exo 9 : String Rotation : TRUE"
        elsif @chaine1 != @chaine2
            puts "Exo 9 : String Rotation : FALSE"
        else
            puts "Exo 9 : Erreur...revoir le code"
        end
    end

end

chaine9 = Chaine.new("Hello", "word")
chaine9.stringRotation("BAC", "CAB")
chaine9.stringRotation("Hello", "word")

=end
=begin

    # EXO 10 : OK
    def longestCommonPrefix(chaine)
        a = chaine
        return "" unless (a.length > 0)
        result = 0
        (0 ... a.first.length).each do |k|
            all_matched = true
            character = a.first[k]
            a.each{ |str| all_matched &= (character == str[k]) }
            break unless all_matched
            result+=1
        end
        puts a.first.slice(0,result)
    end

chaine = ["flower", "flow", "flight"] 
longestCommonPrefix(chaine)

=end


# end
    # Exo  1 : OK
    # EXO  2 : OK
    # EXO  3 : Ok
    # EXO  4 : OK
    # EXO  5 : OK
    # EXO  6 : OK
    # EXO  7 : OK 
    # EXO  8 : OK
    # EXO  9 : OK
    # EXO 10 : OK

# chaine1 = Chaine.new("silent", "listen")
# chaine1.anagram("silent", "listen")
# chaine1.anagram("silent", "total")

# chaine2 = Chaine.new("silent")
# chaine2.stringCompression("aaabbbbcccccddeeeefffjjjhhhhaaaaa")

# chaine4 = Chaine.new("silent")
# chaine4.longestSubstringWithoutRepeatingCharacters("abcabcbb")

# chaine5 = Chaine.new("abc")
# chaine5.stringPermutations("abc")

# chaine6 = Chaine.new("Hello", "word")
# chaine6.reverseWordsInString("Hello", "word")

# chaine7 = Chaine.new("silent")
# chaine7.findAllIndicesOfASubstringInAString("1#3#a#")

#chaine8 = Chaine.new("hello")
#chaine8.canStringRearrangedToPalindrome("civic")
#chaine8.canStringRearrangedToPalindrome("Hello")

# chaine9 = Chaine.new("Hello", "word")
# chaine9.stringRotation("BAC", "CAB")
# chaine9.stringRotation("Hello", "word")

# chaine10 = Chaine.new("flower", "flow", "flight")
# chaine10.longestCommonPrefix("flower", "flow", "flight")




