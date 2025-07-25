class DumpcarCommand < Rails::Command::Base
  class_option :base_dir, type: :string, desc: "the location of your DB dumps, defaults to Rails.root.join('db/dumps')"

  desc "dump", "Dump postgres backup file"
  def dump
    require "rails"
    (Rails.version < "7.1") ? require_application_and_environment! : boot_application!
    require "dumpcar"
    Dumpcar::Instance.new(options).dump
  end

  desc "restore", "Restore postgres backup file"
  def restore
    require "rails"
    (Rails.version < "7.1") ? require_application_and_environment! : boot_application!
    require "dumpcar"
    Dumpcar::Instance.new(options).restore
  end
end
