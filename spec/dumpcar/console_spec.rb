require "spec_helper"

RSpec.describe "Console", type: :aruba do
  let(:working_dir) { ArubaWorkingDirectory.new }

  def rails_command(dumpcar_commands)
    "bundle exec rails " + dumpcar_commands
  end

  def prepare_working_dir
    working_dir.mkdir_p
    working_dir.copy_all_from(Rails.root.join("db/dumps"))
  end

  around(:each, type: :aruba) do |ex|
    prepare_working_dir
    ex.run
  end

  describe ":dump" do
    it "run dump" do
      SimpleObject.create(name: "so-1")

      expect do
        run_command(rails_command("dumpcar:dump --base=#{working_dir.pathname}"))
        expect(last_command_started).to be_successfully_executed
      end.to change { working_dir.pathname.children.count }.by(1)

      expect(SimpleObject.count).to eq 1
    end

    it "full dump and restore" do
      SimpleObject.create(name: "so-1")

      expect do
        run_command(rails_command("dumpcar:dump --base=#{working_dir.pathname}"))
        expect(last_command_started).to be_successfully_executed
      end.to change { working_dir.pathname.children.count }.by(1)

      expect(SimpleObject.count).to eq 1
      SimpleObject.delete_all

      expect(SimpleObject.count).to eq 0

      run_command(rails_command("dumpcar:restore --base=#{working_dir.pathname}"))
      expect(last_command_started).to be_successfully_executed
      sleep(5)
      expect(SimpleObject.count).to eq 1
    end
  end

  describe ":restore" do
    it "restores the last item by default" do
      expect(SimpleObject.count).to eq 0
      run_command(rails_command("dumpcar:restore --base=#{working_dir.pathname}"))
      expect(last_command_started).to be_successfully_executed

      expect(SimpleObject.count).to eq 3
    end
  end
end
