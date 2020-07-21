def merge_sort(array)
  return array if array.length == 1
  split_array = array.each_slice((array.size/2.0).round).to_a
  half1 = merge_sort(split_array[0])
  half2 = merge_sort(split_array[1])
  new_array = []

  until half1.empty? && half2.empty? do
    unless half1.empty? || half2.empty?
      if half1[0] > half2[0]
        new_array.push(half2.shift)
      else
        new_array.push(half1.shift)
      end
    end
    if half1.empty?
      new_array.push(half2.shift)
    elsif half2.empty?
      new_array.push(half1.shift)
    end
  end
  return new_array
end

puts merge_sort([1,4,6,7,8,2,3,5])
