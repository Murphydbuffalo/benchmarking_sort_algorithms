require 'benchmark'

def linear_search(list, search_term)
  list.each_with_index do |item, i|
    if item == search_term
      #puts list[i]
      return list[i]
    end 
  end
  puts "#{search_term} is not in this list."
end

def binary_search(sorted_list, search_term)
  min, max = 0, sorted_list.length - 1
  until min == max
    middle = (min + max) / 2
    if sorted_list[middle] == search_term
      #puts sorted_list[middle]
      return  sorted_list[middle] 
    elsif sorted_list[middle] < search_term
      min = middle + 1
    else
      max = middle - 1
    end
  end
  puts "#{search_term} is not in this list."
end

unsorted_list = File.read('unsorted_names.txt').split(',')
sorted_list = File.read('sorted_names.txt').split(',')

Benchmark.bm do |x|
  x.report('Linear Search:') { 100.times do linear_search(unsorted_list, 'Sandra') end }
  x.report('Binary Seaerch:') { 100.times do binary_search(sorted_list, 'Michael') end }
end
