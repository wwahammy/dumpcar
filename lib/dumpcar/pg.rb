module Dumpcar
  class Pg
    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def restore(filename)
      with_database_config do |config|
        config => {password:, host:, port:, username:, database:}
        line = Terrapin::CommandLine.new("pg_restore",
          "--verbose --clean --no-acl --no-owner -h :host -U :username -d :database -p :port :filename",
          environment: {"PGPASSWORD" => password})

        puts line.command(password:, host:, port:, username:, database:)
        line.run(password:, host:, port:, username:, database:)
      end
    end

    def dump(filename)
      with_database_config do |config|
        config => {password:, host:, port:, username:, database:}
        result = "PGPASSWORD=#{password} pg_dump --host #{host} --port #{port} --username #{username} --clean --format=c --create  --if-exists --no-owner --no-acl #{database} --file=#{filename}"
        puts result
        `#{result} `
      end
    end

    def with_database_config
      yield self.class.defaults.merge(connection)
    end

    def self.defaults
      {
        host: "localhost",
        port: "5432"
      }
    end
  end
end
