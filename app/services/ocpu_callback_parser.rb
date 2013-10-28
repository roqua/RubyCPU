class OcpuCallbackParser
  
  @@instance = OcpuCallbackParser.new
  
  
  ##
  #
  #
  def self.parse(args)
    
    data = args[:result] or raise ArgumentError, "must pass :result to parse from"
  
    information = args[:information] or raise ArgumentError, "must pass :information to know what you are interested in"
      
    return @@instance.parse data, information
    
    
  end
  
  ##
  #
  #
  def parse data, information
    
    case information
    when InformationEnum::SESSION_ID
    
      result = data[0].split("/")[3]

    when InformationEnum::VALUE_CALLBACK_URL

      result = data[0].trim "/"

    when InformationEnum::ALL_PACKAGES

      result = parse_packages data

    when InformationEnum::CALLBACK_URLS
    
      result = parse_to_callback_model data

    end
  
    result
  
  end
  
  ##
  #
  #
  #
  def parse_packages package_list
    
    package_list = package_list.split(" ")[0]
    
    packages = Array.new
    
    package_list.each do |package| 
      
      new OcpuPackage.name = package
      
    end
    
    packages
    
  end
  
  ##
  #
  def parse_to_callback_model response_urls
     
    response_urls = response_urls.split("\n")
    
    ocpu_callback = OcpuCallback.new()
    
    if response_urls.length >= 5 then
      
      ocpu_callback.value = response_urls[OcpuCallback::VALUE_LOCATION]
      
      ocpu_callback.stdout = response_urls[OcpuCallback::STDOUT_LOCATION]
      
      ocpu_callback.source = response_urls[OcpuCallback::SOURCE_LOCATION]
      
      ocpu_callback.console = response_urls[OcpuCallback::CONSOLE_LOCATION]
      
      ocpu_callback.info = response_urls[OcpuCallback::INFO_LOCATION]
      
    end
    
    ocpu_callback
    
  end
  
  private
  
    def instance
      
    end
  
end