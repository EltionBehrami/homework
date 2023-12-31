class LRUCache
    attr_reader :cache

    def initialize(n)
        @size = n
        @cache = []
    end

    def count
        @cache.length 
    end

    def add(ele)
        if @cache.include?(ele)
            @cache.delete(ele)
            @cache << ele 
        elsif 
            @cache.length >= @size
            @cache.shift 
            @cache << ele
        else 
            @cache << ele 
        end 
    # adds element to cache according to LRU principle
    end

    def show
        p @cache
    end

    private
    # helper methods go here!

end

johnny_cache = LRUCache.new(4)

    johnny_cache.add("I walk the line")
    johnny_cache.add(5)

    p johnny_cache.count # => returns 2

    johnny_cache.add([1,2,3])
    johnny_cache.add(5)
    johnny_cache.add(-5)
    johnny_cache.add({a: 1, b: 2, c: 3})
    johnny_cache.add([1,2,3,4])
    johnny_cache.add("I walk the line")
    johnny_cache.add(:ring_of_fire)
    johnny_cache.add("I walk the line")
    johnny_cache.add({a: 1, b: 2, c: 3})

    johnny_cache.show 

