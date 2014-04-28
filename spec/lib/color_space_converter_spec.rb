require "spec_helper"

describe ColorSort::ColorSpaceConverter do
  describe "#hex_rgb_to_lab" do
    subject { ColorSort::ColorSpaceConverter }

    let(:expected_lab_result) {
      [21.041610053894317, 1.0523062624117063, -24.099168114444936]
    }

    context "with a preceeding #" do
      it "converts hex RGB color to LAB" do
        expect(subject.hex_rgb_to_lab("#123456")).to eq(expected_lab_result)
      end
    end

    context "with a preceeding #" do
      it "converts hex RGB color to LAB" do
        expect(subject.hex_rgb_to_lab("123456")).to eq(expected_lab_result)
      end
    end
  end
end
