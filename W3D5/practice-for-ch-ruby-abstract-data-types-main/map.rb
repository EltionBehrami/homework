class Map

    def initialize
        @map = []
    end 

    def set(key, value)
        @map.each do |pair|
            if pair[0] == key
                pair[1] = value
                return
            end
        end 
        @map << [key, value]
    end 

    def get(key)
        @map.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
        nil
    end 

    def delete(key)
        @map.each do |pair|
            if pair[0] == key
                @map.delete(pair)
            end 
        end 
    end 


    def show
        @map.each do |pair|
            puts "#{pair[0]}: #{pair[1]}"
        end
    end 







end 