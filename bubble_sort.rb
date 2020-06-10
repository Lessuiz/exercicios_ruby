require 'pry'

def bubble_sort(array)
  array.each_with_index do |val1, i|
    array[i...array.length].each_with_index do |val2, j|
      if array[i] > array[i+j]
        array[i], array[i+j] = array[i+j], array[i]
      end
    end
  end
  array
end

p bubble_sort([1,3,4,2])

