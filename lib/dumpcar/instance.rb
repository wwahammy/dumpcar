module Dumpcar
  class Instance
    attr_reader :location, :pg
    def initialize(base: Rails.root.join("db/dumps"))
      @location = Location.new(base)
      @pg = Pg.new(get_connection_db_config)
    end

    def dump
      @pg.dump(@location.next)
    end

    def restore
      @pg.restore(@location.last)
    end

    private

    def get_connection_db_config
      (Rails.version < "6.1") ? ActiveRecord::Base.connection_config : ActiveRecord::Base.connection_db_config.configuration_hash
    end
  end
end
