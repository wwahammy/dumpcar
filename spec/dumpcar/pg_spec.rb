RSpec.describe Dumpcar::Pg do
  describe ":dump" do
    it "does not crash" do
      pg = described_class.new(Dumpcar::Util.get_connection_db_config)

      # expect { pg.dump(Rails.root.join("tmp/#{Random.uuid}.dump").to_s) }.to_not raise_error, lambda { |e| puts "here we are!" }
      #
      pg.dump(Rails.root.join("tmp/#{Random.uuid}.dump").to_s)
    end

    it "properly dumps an item"
  end

  describe ":restore" do
    it "does not crash" do
      pg = described_class.new(Dumpcar::Util.get_connection_db_config)

      expect { pg.restore(Dumpcar::Location.new(Rails.root.join("db/dumps")).last) }.to_not raise_error
    end

    it "properly restores an item"
  end
end
