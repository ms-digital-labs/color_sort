require "color_sort/version"
require "color_sort/ordering"
require "color_sort/closest_pair_finder"
require "color_sort/grouped_sort"
require "color_sort/group_sorter"
require "color_sort/distance"
require "color_sort/color_space_converter"
require "color_sort/sorter"

module ColorSort
  def self.sort(colors)
    Sorter.new(colors).sorted
  end

  def self.sort_groups(groups)
    GroupSorter.new(groups).sorted
  end
end
