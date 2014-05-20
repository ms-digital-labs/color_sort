module ColorSort
  module Grouped
    class MultipleItemGroup < BaseGroup
      def sorted
        ordering = Ordering.new(start: start_color, finish: end_color)
        remaining_colors.each do |color|
          ordering.add_lab_color(color)
        end
        ordering.colors
      end

      def items_except_start_color
        result = items.dup
        result.delete_at(result.index(start_color)) unless start_color.nil?
        result
      end

      def remaining_colors
        result = items.dup
        result.delete_at(result.index(start_color)) unless start_color.nil?
        result.delete_at(result.index(end_color)) unless end_color.nil?
        result
      end

      def start_color
        @start_color ||= if previous_group.nil?
                           nil
                         else
                           start_color_calc
                         end
      end

      def end_color
        @end_color ||= if next_group.nil?
                         nil
                       else
                         end_color_calc
                       end
      end

      def end_color_calc
        color, _ = *ClosestPairFinder.pair(items_except_start_color, next_group.items)
        color
      end

      def start_color_calc
        return nil if previous_group.end_color.nil?
        color, _ = *ClosestPairFinder.pair(items, [previous_group.end_color])
        color
      end
    end
  end
end
