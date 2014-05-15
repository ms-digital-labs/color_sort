require "spec_helper"

describe ColorSort::Ordering, :color_doubles do
  describe "#add_lab_color" do
    context "with an empty ordering" do
      it "adds the color to the end of the array" do
        subject.add_lab_color(red)

        expect(subject.colors).to eq([red])
      end
    end

    context "with one color in the ordering" do
      it "adds the color to the end of the array" do
        subject.add_lab_color(red)
        subject.add_lab_color(green)

        expect(subject.colors).to eq([red, green])
      end
    end

    context "with multiple colors in the ordering" do
      context "best position is at the beginning" do
        it "adds the color in the position that minimises total distance" do
          subject.add_lab_color(blue)
          subject.add_lab_color(green)
          subject.add_lab_color(red)

          expect(subject.colors).to eq([red, blue, green])
        end
      end

      context "best position is in the middle" do
        it "adds the color in the position that minimises total distance" do
          subject.add_lab_color(red)
          subject.add_lab_color(green)
          subject.add_lab_color(blue)

          expect(subject.colors).to eq([red, blue, green])
        end
      end

      context "best position is at the end" do
        it "adds the color in the position that minimises total distance" do
          subject.add_lab_color(green)
          subject.add_lab_color(blue)
          subject.add_lab_color(red)

          expect(subject.colors).to eq([green, blue, red])
        end
      end
    end

    context "with a fixed start color" do
      subject { ColorSort::Ordering.new(start: blue) }

      it "doesn't add color at the start, even if it minimises total distance" do
        subject.add_lab_color(green)
        subject.add_lab_color(red)

        expect(subject.colors).to eq([blue, red, green])
      end
    end

    context "with a fixed finish color" do
      subject { ColorSort::Ordering.new(finish: blue) }

      it "doesn't add color at end, even if it minimises total distance" do
        subject.add_lab_color(green)
        subject.add_lab_color(red)

        expect(subject.colors).to eq([green, red, blue])
      end
    end

    context "with fixed start and finish colors" do
      subject { ColorSort::Ordering.new(start: red, finish: blue) }

      it "doesn't add color at start or end, even if it minimises total distance" do
        subject.add_lab_color(green)

        expect(subject.colors).to eq([red, green, blue])
      end
    end
  end
end
