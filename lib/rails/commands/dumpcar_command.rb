class DumpcarCommand < Rails::Command::Base
  desc "dump", "Dump postgres backup file"
  def dump
    require "dumpcar"
    Dumpcar.dump
  end

  desc "restore", "Restore postgres backup file"
  def restore
    require "dumpcar"
    Dumpcar.restore
  end
end
