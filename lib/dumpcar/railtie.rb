module Dumpcar
  class Railtie < Rails::Railtie
    rake_tasks do
      load "dumpcar/tasks/dump.rake"
    end

    generators do
      load "dumpcar/generators/dumpcar_generator.rb"
    end
  end
end
