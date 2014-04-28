require 'spec_helper'

describe ColorSort do
  it 'should have a version number' do
    ColorSort::VERSION.should_not be_nil
  end

  describe ".sort" do
    it "passes the colors to ColorSort::Sorter and calls #sorted" do
      expect(ColorSort.sort(["#123456"])).to eq(["#123456"])
    end
  end
end
