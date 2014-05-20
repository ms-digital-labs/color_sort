module ColorSort
  module Grouped
    class GroupList
      def initialize(initial_groups)
        @groups = initial_groups.map { |items| initialize_group(items) }
        groups.reject(&:empty?).each_cons(2) do |group_a, group_b|
          group_a.next_group = group_b
          group_b.previous_group = group_a
        end
      end

      def sorted
        groups.map(&:sorted)
      end

    private
      attr_reader :groups

      def initialize_group(items)
        if items.size == 0
          EmptyGroup.new(items)
        elsif items.size == 1
          SingleItemGroup.new(items)
        else
          MultipleItemGroup.new(items)
        end
      end
    end
  end
end
