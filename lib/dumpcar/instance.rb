module Dumpcar
  class Instance
    attr_reader :location, :pg
    def initialize(base: Rails.root.join("db/dumps"))
      @location = Location.new(base)
      @pg = Pg.new(Dumpcar::Util.get_connection_db_config)
    end

    def dump
      @pg.dump(@location.next)
    end

    def restore
      @pg.restore(@location.last)
    end
  end
end
