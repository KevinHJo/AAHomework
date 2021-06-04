require 'byebug'

tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
    index = 0
    tiles.each_with_index { |tile, i| index = i if tile == dir }
    index
end

# p slow_dance("up", tiles)
# p slow_dance("right-down", tiles)

tiles = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}

def constant_dance(dir, tiles)
    tiles[dir]
end

p constant_dance("up", tiles)
p constant_dance("right-down", tiles)