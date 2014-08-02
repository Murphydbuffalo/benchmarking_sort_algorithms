require 'benchmark'

# unsorted = [8, 3, 1, 9, 5, 6, 2, 4, 7, -2, 0, 8, 3, 1, 9, 5, 6, 2, 4, 7, -2, 0]
unsorted = Array.new(1000) { rand(-101..100) + 1 }

def selection_sort(list)
  index = 0
  while index < list.length - 1
    min = list[index]
    inner_index = index + 1
    while inner_index < list.length
      if min > list[inner_index]
        min = list[inner_index]
        list[index], list[inner_index] = list[inner_index], list[index]
      end
      inner_index += 1
    end
    index += 1
  end
  list
end

def selection_sort_for_loops(list)
  for index in 0..(list.length - 2)
    min = list[index]
    for inner_index in index..(list.length - 1)
      if min > list[inner_index]
        min = list[inner_index]
        list[index], list[inner_index] = list[inner_index], list[index]
      end
      inner_index += 1
    end
    index += 1
  end
  list
end

def insertion_sort(list)
  index = 0
  while index < list.length - 1
    min = list[index]
    inner_index = index + 1
    while inner_index < list.length
      if min > list[inner_index]
        min = list[inner_index]
        list.delete_at(inner_index)
        list.insert(index, min)
      end
      inner_index += 1
    end
    index += 1
  end
  list
end

def bubble_sort(list)
  while true
    index = 0
    swapped = false
    while index < (list.length - 1)
      if list[index] > list[index + 1]
        list[index], list[index + 1] = list[index + 1], list[index]
        swapped = true
      end
      index += 1
    end
    return list if swapped == false
  end
end

# p selection_sort(unsorted)
# p selection_sort_for_loops(unsorted)
# p insertion_sort(unsorted)
# p bubble_sort(unsorted)

Benchmark.bm do |x|
  x.report('Selection Sort:') { 100.times do selection_sort(unsorted) end }
  x.report('Selection Sort With For Loops:') { 100.times do selection_sort_for_loops(unsorted) end }  
  x.report('Insertion Sort:') { 100.times do insertion_sort(unsorted) end }
  x.report('Bubble Sort:') { 100.times do bubble_sort(unsorted) end }
end

