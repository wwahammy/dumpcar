class ArubaWorkingDirectory
  attr_reader :pathname
  def initialize
    @pathname = Pathname.new(Rails.root).join("tmp", Random.uuid)
    Aruba.configure do |config|
      config.home_directory = @pathname.to_s
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
