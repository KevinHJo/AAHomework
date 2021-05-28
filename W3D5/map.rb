require 'byebug'

class Map
    attr_reader :array

    def initialize
        @array = []
    end

    def set(key, value)
        array << [key, value] unless array.any? { |sub| sub[0] == key }
        array.each do |sub|
            sub[1] = value if sub[0] == key
        end
    end

    def get(key)
        array.each do |sub|
            return sub[1] if sub[0] == key
        end
    end

    def delete(key)
        array.each_with_index do |sub, i|
            array.delete_at(i) if sub[0] == key
        end
    end

    def show
        array
    end
end