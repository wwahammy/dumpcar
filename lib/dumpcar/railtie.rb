module Dumpcar
  class Railtie < Rails::Railtie
    generators do
      load "dumpcar/generators/dumpcar_generator.rb"
    end
  end
end
