RSpec.describe Dumpcar::Instance do
  it "#initialize works properly" do
    expect { Dumpcar::Instance.new }.to_not raise_error
  end

  it "puts things in a different base_folder" do
    base_dir = Pathname.new(Rails.root).join("tmp", "base_folder" + Random.uuid)

    SimpleObject.create(name: "so-1")
    instance = Dumpcar::Instance.new(base_dir:)

    instance.dump

    SimpleObject.delete_all

    expect(SimpleObject).to be_none

    expect(base_dir.children.count).to eq 1

    instance.restore

    expect(SimpleObject.count).to eq 1
  end
end
