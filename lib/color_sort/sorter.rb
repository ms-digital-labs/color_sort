module ColorSort
  class Sorter
    def initialize(colors)
      @colors = colors
    end

    def sorted
      ordering.colors.map { |lab_color|
        color_map[lab_color]
      }
    end

  private
    attr_reader :colors

    def color_map
      @color_map ||= colors.each_with_object({}) { |hex_rgb_color, hash|
        lab_color = ColorSort::ColorSpaceConverter.hex_rgb_to_lab(hex_rgb_color)
        hash[lab_color] = hex_rgb_color
      }
    end

    def lab_colors
      @lab_colors ||= colors.map { |hex_rgb_color|
        ColorSort::ColorSpaceConverter.hex_rgb_to_lab(hex_rgb_color)
      }
    end

    def ordering
      @ordering ||= lab_colors.each_with_object(Ordering.new) { |lab_color, ordering|
        ordering.add_lab_color(lab_color)
      }
    end
  end
end
