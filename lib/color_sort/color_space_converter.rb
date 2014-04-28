module ColorSort
  module ColorSpaceConverter
    def self.hex_rgb_to_lab(hex)
      rgb = Color::RGB.from_html(hex)
      Colorscore::Metrics.xyz_to_lab(*Colorscore::Metrics.rgb_to_xyz(rgb))
    end
  end
end
