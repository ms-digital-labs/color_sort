module ColorSort
  class GroupSorter
    def initialize(groups)
      @groups = groups
    end

    def sorted
      GroupedSort.new(lab_groups).sorted.map { |group|
        group.map { |lab_color|
          color_map[lab_color]
        }
      }
    end

  private
    attr_reader :groups

    def color_map
      @color_map ||= groups.flatten.each_with_object({}) { |hex_rgb_color, hash|
        lab_color = ColorSort::ColorSpaceConverter.hex_rgb_to_lab(hex_rgb_color)
        hash[lab_color] = hex_rgb_color
      }
    end

    def lab_groups
      @lab_groups ||= groups.map { |group|
        group.map { |hex_rgb_color|
          ColorSort::ColorSpaceConverter.hex_rgb_to_lab(hex_rgb_color)
        }
      }
    end
  end
end
