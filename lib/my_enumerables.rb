module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self do
      yield(i)
    end
  end

  def my_each_with_index
    idx = 0
    for i in self do
      yield(i, idx)
      idx += 1
    end
  end

  def my_select
    selected_array = []
    for i in self do
      selected_array << i if yield(i)
    end
    selected_array
  end
  def my_all?
    for i in self do 
        return false unless yield(i)
    end
    return true
  end
  def my_any?
    for i in self do 
        return true if yield(i)
    end
    return false
  end
  def my_none?
    for i in self do 
        return false if yield(i)
    end
    return true
  end
  def my_count
    match_number = 0
    count_number = 0
    for i in self do 
      match_number += 1 if yield(i) if block_given?
      count_number += 1
    end
    return count_number if match_number == 0
    match_number
  end
  def my_map
    mapped_array = []
    for i in self do 
      mapped_array << yield(i)
    end
    mapped_array
  end
  def my_inject(n=0)
    result = 0 + n
    for i in self do 
      result = yield(result, i)
    end
    result
  end
end

