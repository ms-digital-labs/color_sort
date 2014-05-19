module ColorSort
  module Grouped
    class MultipleItemGroup < BaseGroup
      def sorted
        ordering = Ordering.new(start: @start_color, finish: @finish_color)
        remaining_colors.each do |color|
          ordering.add_lab_color(color)
        end
        ordering.colors
      end

      def remaining_colors
        result = items.dup
        result.delete_at(result.index(@start_color)) unless @start_color.nil?
        result.delete_at(result.index(@finish_color)) unless @finish_color.nil?
        result
      end

      def fix_end_color
        unless next_group.nil?
          @finish_color = next_group.closest_item_to(remaining_colors)

          next_group.fix_end_color
        end
      end

      def closest_item_to(other_items)
        @start_color, prev_end = *ClosestPairFinder.pair(items, other_items)
        prev_end
      end

      def start_color
      end
    end
  end
end
