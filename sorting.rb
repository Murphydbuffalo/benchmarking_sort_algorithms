require 'benchmark'

unsorted = [8, 3, 1, 9, 5, 6, 2, 4, 7, -2, 0, 8, 3, 1, 9, 5, 6, 2, 4, 7, -2, 0]

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

def selection_sort_with_insert(list)
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

Benchmark.bm do |x|
  x.report('Swap Values:') { 10000.times do selection_sort(unsorted) end }
  x.report('Insert Value:') { 10000.times do selection_sort_with_insert(unsorted) end }
end

