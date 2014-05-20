module ColorSort
  module Grouped
    class SingleItemGroup < BaseGroup
      def sorted
        items
      end

      def start_color
        @start_color ||= items.first
      end

      def end_color
        @end_color ||= items.first
      end
    end
  end
end
