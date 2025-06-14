RSpec.describe Dumpcar::Instance do
  it "#initialize works properly" do
    expect { Dumpcar::Instance.new }.to_not raise_error
  end
end
