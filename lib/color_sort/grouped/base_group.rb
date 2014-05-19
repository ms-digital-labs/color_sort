module ColorSort
  module Grouped
    class BaseGroup
      attr_accessor :previous_group, :next_group

      def initialize(items)
        @items = items
      end

      def sorted
        raise NotImplementedError
      end

      def start_color
        raise NotImplementedError
      end

      def end_color
        raise NotImplementedError
      end

      def items_except_start_color
        remaining = items.dup
        remaining.delete_at(result.index(start_color)) unless start_color.nil?
      end

    protected
      attr_reader :items
    end
  end
end
