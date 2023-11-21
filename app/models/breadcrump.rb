class Breadcrump
  attr_reader :name, :path

  def initialize(name, path)
    @name = name
    @path = path
  end

  def link?
    @path.present?
  end
end