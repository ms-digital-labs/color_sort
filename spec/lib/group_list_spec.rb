require "spec_helper"

describe ColorSort::Grouped::GroupList, :color_doubles do
  describe "#sorted" do
    let(:group_a) { [red, green, blue, yellow] }
    let(:group_b) { [yellow] }
    let(:group_c) { [red, blue, green] }
    let(:group_d) { [] }
    let(:group_e) { [red, blue, yellow] }
    let(:group_f) { [] }

    let(:expected_a) { [green, blue, red, yellow] }
    let(:expected_b) { [yellow] }
    let(:expected_c) { [red, green, blue] }
    let(:expected_d) { [] }
    let(:expected_e) { [blue, red, yellow] }
    let(:expected_f) { [] }

    it "sorts the colors within their groups" do
      grouped_sort = ColorSort::Grouped::GroupList.new(
        [group_a, group_b, group_c, group_d, group_e, group_f]
      )

      expect(grouped_sort.sorted).to eq(
        [expected_a, expected_b, expected_c, expected_d, expected_e, expected_f]
      )
    end
  end
end
