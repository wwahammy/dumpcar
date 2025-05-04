module Dumpcar
  class Location
    TIMESTAMP_STRFTIME_FORMAT = "%Y%m%d%H%M%S"
    TIMESTAMP_GLOB = 14.times.map { "[0-9]" }.join
    TIMESTAMP_FILE_GLOB = TIMESTAMP_GLOB + "*.dump"

    attr_reader :base
    def initialize(base)
      @base = Pathname.new base
    end

    def dumps
      prepare_base!
      Dir.glob(base.join(TIMESTAMP_FILE_GLOB))
    end

    def first
      prepare_base!
      dumps.first
    end

    def last
      prepare_base!
      dumps.last
    end

    def next
      prepare_base!
      base.join(from_time + ".dump").to_s
    end

    def from_time(time = Time.now.utc)
      time.strftime(TIMESTAMP_STRFTIME_FORMAT)
    end

    private

    def prepare_base!
      FileUtils.mkdir_p base
    end
  end
end
