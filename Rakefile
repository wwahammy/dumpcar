# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

task default: %i[spec standard]

namespace :clean do
  desc "Clean your tmp directory of copies of files used in rspec runs"
  task :tmp do
    tmp_dir_path = Pathname.new(__dir__).join("spec/internal/tmp")
    tmp_dir_path.children.select { |file| file.basename.to_s != ".keep" }.each(&:rmtree)
  end
end

Rake::Task[:clean].enhance do
  Rake::Task["clean:tmp"].invoke
end
