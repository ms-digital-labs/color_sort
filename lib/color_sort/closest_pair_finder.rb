module ColorSort
  class ClosestPairFinder
    def initialize(group_a, group_b)
      @group_a = group_a
      @group_b = group_b
    end

    def pair
      shortest_distance = 1_000_000
      closest_pair = nil

      group_a.each do |color_a|
        group_b.each do |color_b|
          if (current_distance = distance(color_a, color_b)) < shortest_distance
            shortest_distance = current_distance
            closest_pair = [color_a, color_b]
          end
        end
      end

      closest_pair
    end

  private
    attr_reader :group_a, :group_b

    def distance(color_a, color_b)
      ColorSort::Distance.ciede2000(color_a, color_b)
    end
  end
end
