require 'byebug'

def sluggish(array)
    longest = array[0]
    (0...array.length - 1).each do |i1|
        (i1 + 1...array.length).each do |i2|
            longest = array[i2] if array[i2].length > array[i1].length
        end
    end

    longest
end

def dominant(array, &prc)
    merge_sort(array, &prc)[0]
end

def merge_sort(array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
end

def merge(left, right, &prc)
    merged_array = []
    prc ||= Proc.new { |ele1, ele2| ele2.length <=> ele1.length }
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
end

def clever(array)
    longest = array[0]
    array.each do |fish|
        longest = fish if longest.length < fish.length
    end
    longest
end

array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p clever(array)