require "spec_helper"

describe ColorSort::Sorter do
  describe "#sorted" do
    let(:red_1) { "#ff0000" }
    let(:red_2) { "#cc0000" }
    let(:green_1) { "#00ff00" }
    let(:green_2) { "#00cc00" }
    let(:blue_1) { "#0000ff" }
    let(:blue_2) { "#0000cc" }

    let(:colors) { [red_1, blue_1, green_1, red_2, blue_2, green_2] }

    subject { described_class.new(colors) }

    it "orders the colors perceptually" do
      expect(subject.sorted).to eq([red_1, red_2, blue_2, blue_1, green_2, green_1])
    end
  end
end
