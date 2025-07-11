module Dumpcar::Util
  def self.get_connection_db_config
    (Rails.version < "6.1") ? ActiveRecord::Base.connection_config : ActiveRecord::Base.connection_db_config.configuration_hash
  end

  def self.logger
    Rails.logger
  end
end
