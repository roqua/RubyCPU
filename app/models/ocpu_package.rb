class OcpuPackage < ActiveRecord::Base
  
  def self.build_from_list package_list
    
    package_list = package_list.split(" ")
    
    packages = Array.new
    
    package_list.each do |package| 
      
      packages << new.name = package
      
    end
    
    packages
    
  end
  
end
