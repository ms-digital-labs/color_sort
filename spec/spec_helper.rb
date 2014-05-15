$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'color_sort'
require "rspec/radar"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  shared_context "with color doubles", :color_doubles do
    let(:red) { double(:red) }
    let(:green) { double(:green) }
    let(:blue) { double(:blue) }

    before do
      set_distance(red, red, 0)
      set_distance(green, green, 0)
      set_distance(blue, blue, 0)

      set_distance(red, blue, 1)
      set_distance(blue, green, 2)
      set_distance(red, green, 3)
    end

    def set_distance(color_a, color_b, distance)
      allow(ColorSort::Distance).to receive(:ciede2000)
                                      .with(color_a, color_b)
                                      .and_return(distance)
      allow(ColorSort::Distance).to receive(:ciede2000)
                                      .with(color_b, color_a)
                                      .and_return(distance)
    end
  end
end
