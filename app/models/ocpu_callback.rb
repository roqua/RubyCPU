class OcpuCallback < ActiveRecord::Base
  
  VALUE_LOCATION = 0
  STDOUT_LOCATION = 1
  SOURCE_LOCATION = 2
  CONSOLE_LOCATION = 3
  INFO_LOCATION = 4
  
  def self.build_from_response response_urls
    
    response_urls = response_urls.split("\n")
    
    ocpu_callback = new
    
    if response_urls.length >= 5 then
      
      ocpu_callback.value = response_urls[OcpuCallback::VALUE_LOCATION]
      
      ocpu_callback.stdout = response_urls[OcpuCallback::STDOUT_LOCATION]
      
      ocpu_callback.source = response_urls[OcpuCallback::SOURCE_LOCATION]
      
      ocpu_callback.console = response_urls[OcpuCallback::CONSOLE_LOCATION]
      
      ocpu_callback.info = response_urls[OcpuCallback::INFO_LOCATION]
      
      ocpu_callback.session_code = ocpu_callback.value.split("/")[3]
      
    end
    
    ocpu_callback
    
  end
  
end
