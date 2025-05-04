RSpec.describe Dumpcar::Location do
  let(:first_dump_regex) { /.+\/20250601022124.*.dump/ }
  let(:last_dump_regex) { /.+\/20250601022144.*.dump/ }
  let(:base_dir) { Rails.root.join("db/dumps") }
  subject(:location) { described_class.new(base_dir) }

  describe "#first" do
    it { is_expected.to delegate_method(:first).to(:dumps) }

    it "properly generates the base dir before if missing"
  end

  describe "#last" do
    it { is_expected.to delegate_method(:last).to(:dumps) }
    it "properly generates the base dir before if missing"
  end

  describe "#dumps" do
    it "returns 2 items" do
      expect(location.dumps.count).to eq 2
      expect(location.dumps.first).to match(first_dump_regex)
      expect(location.dumps.last).to match(last_dump_regex)
    end

    it "properly generates the base dir before if missing"
  end

  describe "#next" do
    it "generates the correct path" do
      travel_to Time.utc(2020, 1, 3, 4, 5, 6) do
        expect(location.next).to eq base_dir.join("20200103040506.dump").to_s
      end
    end
    it "properly generates the base dir before if missing"
  end
end
