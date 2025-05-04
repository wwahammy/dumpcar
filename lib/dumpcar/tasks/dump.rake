namespace :dumpcar do
  namespace :pg do
    desc "Dumped postgres backup file"
    task dump: :environment do
      Dumpcar.dump
    end

    desc "Load dumped postgres backup file"
    task restore: :environment do
      Dumpcar.restore
    end

    def say(something)
      puts(something)
    end
  end
end
