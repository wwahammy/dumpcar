require "active_model"
module Dumpcar
  class Instance
    include ActiveModel::Model

    attr_accessor :connection, :location, :pg, :base
    def initialize(attributes = {})
      cleanup_arguments(attributes)
      @connection = ActiveRecord::Base.connection_db_config.configuration_hash
      @location = Location.new(base)
      @pg = Pg.new(connection)
    end

    def dump
      @pg.dump(@location.next)
    end

    def restore
      @pg.restore(@location.last)
    end

    def cleanup_arguments(arguments)
      arguments = arguments.to_h.with_indifferent_access
      unless arguments.has_key?("base")
        arguments["base"] = Rails.root.join("dumps/db")
      end

      assign_attributes(arguments)
    end
  end
end
