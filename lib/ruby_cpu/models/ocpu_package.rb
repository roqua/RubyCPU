class OcpuPackage
  attr_accessor :name

  def initialize name
    @name = name
  end

  def self.build_from_list package_list
    package_list.split(" ").map do |package_string|
      new(package_string)
    end
  end
end