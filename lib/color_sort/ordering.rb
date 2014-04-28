require "color_sort/distance"

module ColorSort
  class Ordering
    attr_reader :colors

    def initialize
      @colors = []
    end

    def add_lab_color(color)
      if colors.size < 2
        colors << color
      else
        min_delta = distance(color, colors.first)
        min_delta_index = 0

        (1...colors.size).each do |i|
          remove_distance = distance(colors[i-1], colors[i])
          add_distance = distance(colors[i-1], color) + distance(color, colors[i])
          delta = add_distance - remove_distance
          if delta < min_delta
            min_delta = delta
            min_delta_index = i
          end
        end

        if distance(colors.last, color) < min_delta
          min_delta_index = colors.size
        end

        colors.insert(min_delta_index, color)
      end
    end

  private
    def distance(color_a, color_b)
      ColorSort::Distance.ciede2000(color_a, color_b)
    end
  end
end
