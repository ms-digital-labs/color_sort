module ColorSort
  class GroupedSort
    def initialize(groups)
      @groups = groups
    end

    def sorted
      non_empty_groups = groups.reject(&:empty?).map { |colors|
        if colors.size == 1
          SingleColorGroup.new(colors)
        else
          ColorGroup.new(colors)
        end
      }

      non_empty_groups.each_cons(2) do |group_a, group_b|
        group_a_finish, group_b_start = *ClosestPairFinder.pair(
                                          group_a.remaining_colors,
                                          group_b.remaining_colors
                                        )
        group_a.fix_finish(group_a_finish)
        group_b.fix_start(group_b_start)
      end

      indexes_of_empty_groups = groups.each_with_index.select { |group, i|
        group.empty?
      }.map(&:last)

      result = non_empty_groups.map { |x| x.sorted }
      indexes_of_empty_groups.each do |i|
        result.insert(i, [])
      end
      result
    end

  private
    attr_reader :groups
  end

  class ColorGroup
    def initialize(colors)
      @colors = colors
    end

    def fix_start(color)
      @start = color
    end

    def fix_finish(color)
      @finish = color
    end

    def remaining_colors
      result = colors.dup
      result.delete_at(result.index(start)) unless start.nil?
      result.delete_at(result.index(finish)) unless finish.nil?
      result
    end

    def sorted
      ordering = Ordering.new(start: start, finish: finish)
      remaining_colors.each do |color|
        ordering.add_lab_color(color)
      end
      ordering.colors
    end

  private
    attr_reader :colors, :start, :finish
  end

  class SingleColorGroup
    def initialize(colors)
      @colors = colors
    end

    def fix_start(color)
    end

    def fix_finish(color)
    end

    def remaining_colors
      colors
    end

    def sorted
      colors
    end

  private
    attr_reader :colors
  end
end
