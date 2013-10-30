class OcpuPackage
	
	attr_accessor :name

	def self.build_from_list package_list

    package_list = package_list.split(" ")

    packages = Array.new

    package_list.each do |package| 
      current_package = new
			current_package.name = package
      packages << current_package

    end

    packages

  end
	
end