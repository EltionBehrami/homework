require "byebug"


class Array
  # Write a new `Array#merge_sort` method; it should not modify the array it is
  # called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new{|x, y|x <=> y}
    return self if self.length < 2

    mid_idx = self.length / 2
    left = self[0...mid_idx].merge_sort(&prc)
    right = self[mid_idx..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = [] 

    until left.empty? || right.empty? 

      if prc.call(left, right) == -1
        merged << left.shift
      else 
        merged << right.shift 
      end 
    end 

    merged + left + right

  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # N.B.: order matters. You want each of the pairs to be sorted with the
  # smaller index before bigger index. You want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = [] 
    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == target
      end 
    end 
    pairs
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper.)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    flattened = [] 
    self.each do |ele|
      if ele.is_a?(Array) && (level.nil? || level > 0)
        flattened += ele.my_flatten(level.nil? ? nil : level - 1)
      else 
        flattened << ele
      end 
    end

    flattened
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all substrings
  # that are equal to their reverse image ("abba" == "abba"). You should only
  # include substrings of length > 1.

  def symmetric_substrings

    holder = [] 

    (0...self.length).each do |i|
      (i...self.length).each do |j|
        substring = self[i..j]
        holder << substring if is_palindrome?(substring) && substring.length > 1
      end 
    end 
    holder

  end


  def is_palindrome?(str)
    str == str.reverse
  end

end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  holder = [] 
  i = 2 
  while holder.length < n 
    if is_prime?(i)
      holder << i 
    end 
    i+= 1
  end 
  holder[-1]
end

def is_prime?(num)  
  return false if num < 2

    (2...num).each do |i|
      if num % i == 0 
        return false 
      end 
    end 
  true
end 




class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0 
    while i < self.length
      prc.call(self[i])
      i += 1
    end 
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    holder = [] 

    self.each do |ele|
      if prc.call(ele)
        holder << ele 
      end 
    end 
    holder
  end
end