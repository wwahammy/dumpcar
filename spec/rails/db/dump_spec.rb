# frozen_string_literal: true

RSpec.describe Rails::Db::Dump do
  it "has a version number" do
    expect(Rails::Db::Dump::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
