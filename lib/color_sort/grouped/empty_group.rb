module ColorSort
  module Grouped
    class EmptyGroup < BaseGroup
      def sorted
        []
      end

      def start_color
        @start_color ||= unless next_group.nil?
                           next_group.start_color
                         end
      end

      def end_color
        @end_color ||= unless previous_group.nil?
                         previous_group.end_color
                       end
      end
    end
  end
end
