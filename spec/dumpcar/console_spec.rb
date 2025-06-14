require "spec_helper"

RSpec.describe "Console", type: :aruba do
  def rails_command(dumpcar_commands)
    "bundle exec rails " + dumpcar_commands
  end

  around(:each, type: :aruba) do |ex|
    # prepare_working_dir
    if ENV["BUNDLE_GEMFILE"]
      set_environment_variable("BUNDLE_GEMFILE", ENV["BUNDLE_GEMFILE"])
    end
    ex.run
  end

  describe ":dump"

  describe ":restore" do
    it "restores the last item by default" do
      run_command(rails_command("dumpcar:restore"))
      expect(last_command_started).to be_successfully_executed
    end
  end
end
