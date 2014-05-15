require "spec_helper"

describe ColorSort::ClosestPairFinder, :color_doubles do
  describe "#pair" do
    subject { ColorSort::ClosestPairFinder.new([red, green], [blue]) }

    it "returns the pair of colors (one from each group) that are closest" do
      expect(subject.pair).to eq([red, blue])
    end
  end
end
