module Dumpcar
  class Instance
    attr_reader :location, :pg
    def initialize(base: Rails.root.join("db/dumps"), connection: ActiveRecord::Base.connection_db_config.configuration_hash)
      @location = Location.new(base)
      @pg = Pg.new(connection)
    end

    def dump
      @pg.dump(@location.next)
    end

    def restore
      @pg.restore(@location.last)
    end
  end
end
