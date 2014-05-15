require "spec_helper"

describe ColorSort::ClosestPairFinder, :color_doubles do
  describe ".pair" do
    subject { ColorSort::ClosestPairFinder }

    it "returns the pair of colors (one from each group) that are closest" do
      expect(subject.pair([red, green], [blue])).to eq([red, blue])
    end
  end
end
