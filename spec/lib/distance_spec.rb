require "spec_helper"

describe ColorSort::Distance do
  describe "#ciede2000" do
    include ColorSort::Distance

    let(:distance) { double(:distance) }

    it "splats the lab colors and passes them to Colorscore" do
      expect(Colorscore::Metrics).to receive(:delta_e_cie_2000)
                                      .with(1, 2, 3, 4, 5, 6)

      ciede2000([1, 2, 3], [4, 5, 6])
    end

    it "only calls in to Colorscore once for each pair of colors" do
      expect(Colorscore::Metrics).to receive(:delta_e_cie_2000)
                                      .with(1, 2, 3, 4, 5, 6)
                                      .once
                                      .and_return(distance)

      expect(ciede2000([1, 2, 3], [4, 5, 6])).to eq(distance)
      expect(ciede2000([4, 5, 6], [1, 2, 3])).to eq(distance)
    end
  end
end
