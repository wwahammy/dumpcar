namespace :dumpcar do
  desc "Dumped postgres backup file"
  task dump: :environment do
    Dumpcar.dump
  end

  desc "Load dumped postgres backup file"
  task restore: :environment do
    Dumpcar.restore
  end
end
