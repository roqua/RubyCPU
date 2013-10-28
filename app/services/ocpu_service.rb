class OcpuService
  #include WebserviceHelper
  require 'rest_client'
  require 'json'
  
  OCPU_PATH = "ocpu"
  LIBRARY_PATH = "library"
  LANGUAGE = "R"

  def initialize serviceLocation
    
    # Remove the trailing slash, if present
    serviceLocation.trim! "/"
    
    @service_location = serviceLocation
    Rails.logger.debug("OpenCpu service Initialized")
    
  end
  
  def all_packages
    
    Rails.logger.debug([@service_location, OCPU_PATH, LIBRARY_PATH].join("/"))
    
    packages = RestClient.get [@service_location, OCPU_PATH, LIBRARY_PATH].join("/")
    
    OcpuCallbackParser.parse result: packages, information: InformationEnum::ALL_PACKAGES
    
  end
  
  
  def calculate_and_retrieve calculation_request
    
    result = calculate calculation_request
    
    retrieve_result result, ReturnTypeEnum::JSON
  
  end
  
  ##
  # Can handle a certain calculation request. The +calculation_request+ passed
  # to this function is sent to the OpenCPU service.
  # This function returns the URLS on which the data can be retrieved.
  def calculate calculation_request
    
    json_data = JSON.parse(calculation_request.data)

    result = RestClient.post [@service_location, OCPU_PATH, LIBRARY_PATH, calculation_request.package, LANGUAGE, calculation_request.function].join('/'), calculation_request.data , :content_type => :json, :accept => :json
    
  end
  
  ##
  # Retrieves the result from the given +session+ in the given +datatype+.
  #
  # OpenCPU first wants to store the data locally, in order to improve caching.
  # When the call is performed, one gets a callback URL on which a get request 
  # should be performed. This is done in this method.
  def retrieve_result session, datatype 
    
    Rails.logger.debug session
    
    callback_url = OcpuCallbackParser.parse result: session , information: InformationEnum::VALUE_CALLBACK_URL
    
    Rails.logger.debug [@service_location,callback_url, datatype].join("/")
    
    JSON.parse(RestClient.get [@service_location,callback_url, datatype].join("/"))
    
  end
  
end