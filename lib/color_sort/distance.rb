require "colorscore"

module ColorSort
  module Distance
    def self.ciede2000(lab_color_a, lab_color_b)
      cache_key = [lab_color_a, lab_color_b].sort
      ciede2000_cache[cache_key] ||=
        Colorscore::Metrics.delta_e_cie_2000(*lab_color_a, *lab_color_b)
    end

  private
    def self.ciede2000_cache
      @ciede2000_cache ||= {}
    end
  end
end
