module ColorSort
  module Grouped
    class MultipleItemGroup < BaseGroup
      def sorted
        ordering = Ordering.new(start: start_color, finish: end_color)
        items_except(start_color, end_color).each do |color|
          ordering.add_lab_color(color)
        end
        ordering.colors
      end

      def start_color
        @start_color ||= calculate_start_color
      end

      def end_color
        @end_color ||= calculate_end_color
      end

    private
      def calculate_end_color
        if next_group.nil?
          nil
        else
          closest_color(items_except(start_color), next_group.items)
        end
      end

      def calculate_start_color
        if previous_group.nil? || previous_group.end_color.nil?
          nil
        else
          closest_color(items, [previous_group.end_color])
        end
      end

      def closest_color(my_colors, other_colors)
        color, _ = *ClosestPairFinder.pair(my_colors, other_colors)
        color
      end

      def items_except(*ignored_items)
        remaining = items.dup
        ignored_items.each do |ignored_item|
          remaining.delete_at(remaining.index(ignored_item)) unless ignored_item.nil?
        end
        remaining
      end
    end
  end
end
