class ArubaWorkingDirectory
  attr_reader :pathname
  def initialize
    @pathname = Pathname.new(Aruba.config.home_directory).join(Random.uuid)
    Aruba.configure do |config|
      config.working_directory = name
    end
  end

  def name
    pathname.basename
  end

  def mkdir_p
    FileUtils.mkdir_p(pathname)
  end

  def copy_all_from(path)
    FileUtils.copy(Pathname.new(path).children, pathname)
  end
end
